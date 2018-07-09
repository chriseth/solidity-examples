  /*
   * Modified from chriseth's code. Copyright chriseth and Jinhua Wang.
   * Permission is hereby granted, free of charge, to any person obtaining a copy
   * of this software and associated documentation files (the "Software"), to deal
   * in the Software without restriction, including without limitation the rights
   * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   * copies of the Software, and to permit persons to whom the Software is
   * furnished to do so, subject to the following conditions:

   * The above copyright notice and this permission notice shall be included in all
   * copies or substantial portions of the Software.

   * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
   * SOFTWARE.
   */

struct Heap[T] {
    T[] data;
}

library MinHeap_impl[T] {
  /*
   * Implementation of Minimum Heap
   */
  function insert(Heap[T] storage _heap, T _value)
  {
    _heap.data.length++;
    for (
      uint _index = _heap.data.length - 1;
      _index > 0 && _value < _heap.data[_index / 2];
      _index /= 2)
    {
      _heap.data[_index] = _heap.data[_index / 2];
    }
    _heap.data[_index] = _value;
  }
  function top(Heap[T] storage _heap) returns (T)
  {
    return _heap.data[0];
  }
  function pop(Heap[T] storage _heap)
  {
    T storage last = _heap.data[_heap.data.length - 1];
    for (
      uint index = 0;
      2 * index < _heap.data.length
      ;)
    {
      uint nextIndex = 2 * index;
      if (2 * index + 1 < _heap.data.length && _heap.data[2 * index + 1] < _heap.data[2 * index])
        nextIndex = 2 * index + 1;
      if (_heap.data[nextIndex] < last)
        _heap.data[index] = _heap.data[nextIndex];
      else
        break;
      index = nextIndex;
    }
    _heap.data[index] = last;
    _heap.data.length--;
  }
}

library MaxHeap_impl[T] {
  /*
   * Implementation of Maximum Heap
   */
  function insert(Heap[T] storage _heap, T _value)
  {
    _heap.data.length++;
    for (
      uint _index = _heap.data.length - 1;
      _index > 0 && _value > _heap.data[_index / 2];
      _index /= 2)
    {
      _heap.data[_index] = _heap.data[_index / 2];
    }
    _heap.data[_index] = _value;
  }
  function top(Heap[T] storage _heap) returns (T)
  {
    return _heap.data[0];
  }
  function pop(Heap[T] storage _heap)
  {
    T storage last = _heap.data[_heap.data.length - 1];
    for (
      uint index = 0;
      2 * index < _heap.data.length
      ;)
    {
      uint nextIndex = 2 * index;
      if (2 * index + 1 < _heap.data.length && _heap.data[2 * index + 1] > _heap.data[2 * index])
        nextIndex = 2 * index + 1;
      if (_heap.data[nextIndex] > last)
        _heap.data[index] = _heap.data[nextIndex];
      else
        break;
      index = nextIndex;
    }
    _heap.data[index] = last;
    _heap.data.length--;
  }
}