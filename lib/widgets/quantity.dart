import 'package:flutter/material.dart';

class QuantitySelector extends StatefulWidget {
  final int initialQuantity;
  final ValueChanged<int> onQuantityChanged;

  const QuantitySelector({
    Key? key,
    required this.initialQuantity,
    required this.onQuantityChanged,
  }) : super(key: key);

  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.initialQuantity;
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.onQuantityChanged(_quantity);
      }
    });
  }

  void _increaseQuantity() {
    setState(() {
      _quantity++;
      widget.onQuantityChanged(_quantity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.green,
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: _decreaseQuantity,
            icon: const Icon(Icons.remove, size: 15, color: Colors.white),
          ),
          Text(
            '$_quantity',
            style: const TextStyle(
                fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: _increaseQuantity,
            icon: const Icon(Icons.add, size: 15, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
