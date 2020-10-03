class Breastfeeding < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '完全母乳' },
    { id: 2, name: '母乳とミルクの両方' },
    { id: 3, name: 'ミルクのみ' },
    { id: 4, name: '特に希望なし' }
  ]
end
