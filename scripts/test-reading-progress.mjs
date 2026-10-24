import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { runInNewContext } from 'node:vm';

const source = readFileSync(new URL('../assets/js/orbit-reading-progress.js', import.meta.url), 'utf8');

function fixture({ height = 1000, viewport = 400 } = {}) {
  const writes = { hidden: 0, aria: 0, transform: 0, label: 0 };
  const state = { height, start: 100, hidden: true, value: '0', transform: '', label: '阅读进度 0%' };
  const events = new Map();
  const frames = [];
  let observer;
  const bar = { style: {
    get transform() { return state.transform; },
    set transform(value) { writes.transform++; state.transform = value; }
  } };
  const label = {
    get textContent() { return state.label; },
    set textContent(value) { writes.label++; state.label = value; }
  };
  const progress = {
    firstElementChild: bar, lastElementChild: label,
    get hidden() { return state.hidden; },
    set hidden(value) { writes.hidden++; state.hidden = value; },
    getAttribute() { return state.value; },
    setAttribute(name, value) { assert.equal(name, 'aria-valuenow'); writes.aria++; state.value = value; }
  };
  const article = {
    getBoundingClientRect() { return { top: state.start - window.scrollY }; },
    get offsetHeight() { return state.height; }
  };
  const window = {
    scrollY: 0, innerHeight: viewport,
    requestAnimationFrame(callback) { frames.push(callback); },
    addEventListener(name, callback) { events.set(name, callback); }
  };
  class ResizeObserver {
    constructor(callback) { observer = callback; }
    observe(element) { assert.equal(element, article); }
  }
  window.ResizeObserver = ResizeObserver;
  const document = {
    querySelector(selector) { return selector.includes('progressbar') ? progress : article; },
    addEventListener(name, callback, options) { assert.deepEqual(options.passive, true); events.set(name, callback); }
  };
  runInNewContext(source, { document, window, ResizeObserver });
  return {
    writes, state, window, frames,
    event(name) { events.get(name)(); },
    resized() { observer(); },
    flush() { assert.equal(frames.length, 1); frames.shift()(); }
  };
}

test('coalesces scroll events and avoids writes when the displayed state is unchanged', () => {
  const page = fixture();
  const initial = { ...page.writes };
  for (let i = 0; i < 10; i++) page.event('scroll');
  page.flush();
  assert.deepEqual(page.writes, initial);
  page.window.scrollY = 400;
  page.event('scroll'); page.flush();
  assert.equal(page.state.value, '50');
  assert.equal(page.state.label, '阅读进度 50%');
  assert.equal(page.state.transform, 'scaleX(0.5)');
  const moved = { ...page.writes };
  page.event('load'); page.event('resize'); page.resized(); page.flush();
  assert.deepEqual(page.writes, moved);
});

test('sub-percent scrolling updates the visual bar without rewriting the rounded label or ARIA value', () => {
  const page = fixture();
  page.window.scrollY = 101;
  const initial = { ...page.writes };
  page.event('scroll'); page.flush();
  assert.equal(page.writes.transform, initial.transform + 1);
  assert.equal(page.writes.aria, initial.aria);
  assert.equal(page.writes.label, initial.label);
  assert.equal(page.writes.hidden, initial.hidden);
});

test('recomputes geometry after article or viewport changes and hides progress for short content', () => {
  const page = fixture();
  page.window.scrollY = 400;
  page.event('scroll'); page.flush();
  page.state.height = 1800;
  page.resized(); page.flush();
  assert.equal(page.state.value, '21');
  page.window.innerHeight = 2000;
  page.event('resize'); page.flush();
  assert.equal(page.state.hidden, true);
  assert.equal(page.state.value, '100');
  const previous = { ...page.writes };
  page.event('scroll'); page.flush();
  assert.deepEqual(page.writes, previous);
});
