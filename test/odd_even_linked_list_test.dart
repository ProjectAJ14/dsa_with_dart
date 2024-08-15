import 'package:dsa_with_dart/odd_even_linked_list.dart';
import 'package:test/test.dart';

void main() {
  group('Node', () {
    test('fromList creates a linked list correctly', () {
      final node = Node.fromList([1, 2, 3, 4, 5]);
      expect(node.toList(), equals([1, 2, 3, 4, 5]));
    });

    test('toList converts linked list to list correctly', () {
      final node = Node(data: 1, next: Node(data: 2, next: Node(data: 3)));
      expect(node.toList(), equals([1, 2, 3]));
    });
  });

  group('oddEvenList', () {
    test('handles empty list', () {
      expect(() => Node.fromList([]).oddEvenList(), throwsA(isA<Error>()));
    });

    test('handles single element list', () {
      final node = Node.fromList([1]);
      node.oddEvenList();
      expect(node.toList(), equals([1]));
    });

    test('handles two element list', () {
      final node = Node.fromList([1, 2]);
      node.oddEvenList();
      expect(node.toList(), equals([1, 2]));
    });

    test('handles odd number of elements', () {
      final node = Node.fromList([1, 2, 3, 4, 5]);
      node.oddEvenList();
      expect(node.toList(), equals([1, 3, 5, 2, 4]));
    });

    test('handles even number of elements', () {
      final node = Node.fromList([1, 2, 3, 4, 5, 6]);
      node.oddEvenList();
      expect(node.toList(), equals([1, 3, 5, 2, 4, 6]));
    });

    test('handles example from problem statement', () {
      final node = Node.fromList([2, 1, 3, 5, 6, 4, 7]);
      node.oddEvenList();
      expect(node.toList(), equals([2, 3, 6, 7, 1, 5, 4]));
    });

    test('preserves relative order within odd and even groups', () {
      final node = Node.fromList([1, 2, 3, 4, 5, 6, 7, 8, 9]);
      node.oddEvenList();
      expect(node.toList(), equals([1, 3, 5, 7, 9, 2, 4, 6, 8]));
    });
  });
}
