class Node {
  final int data;
  Node? next;

  Node({
    required this.data,
    this.next,
  });

  factory Node.fromList(List<int> list) {
    Node? last;
    for (int i = list.length - 1; i >= 0; i--) {
      last = Node(data: list[i], next: last);
    }
    return last!;
  }

  List<int> toList() {
    var head = this;
    final list = <int>[];
    while (head.next != null) {
      list.add(head.data);
      head = head.next!;
    }
    list.add(head.data);
    return list;
  }

  void oddEvenList() {
    var odd = this;
    var even = next;
    var evenHead = even;
    while (even != null && even.next != null) {
      odd.next = even.next;
      odd = odd.next!;
      even.next = odd.next;
      even = even.next;
    }
    odd.next = evenHead;
  }

  @override
  String toString() {
    Node? head = this;
    final buffer = StringBuffer('(');
    while (head?.next != null) {
      buffer.write('${head?.data} -> ');
      head = head?.next;
    }
    buffer.write('${head?.data})');
    return buffer.toString();
  }
}

void main() {
  print("Example 1:");
  final head = Node.fromList([1, 2, 3, 4, 5]);
  print("Node: $head");
  head.oddEvenList();
  print("Node.toList(): ${head.toList()}");

  print("\nExample 2:");
  final head2 = Node.fromList([2, 1, 3, 5, 6, 4, 7]);
  print("Node: $head2");
  head2.oddEvenList();
  print("Node.toList(): ${head2.toList()}");
}
