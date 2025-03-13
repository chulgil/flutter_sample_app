import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/presentation/components/filter_buttons.dart';
import 'package:flutter_sample_app/core/presentation/components/small_button.dart';
import 'package:flutter_sample_app/domain/filter/filter_state.dart';
import 'package:flutter_sample_app/ui/text_styles.dart';

class SearchFilterSheet extends StatefulWidget {
  final FilterState state;
  final void Function(FilterState state) onChangeFilter;

  const SearchFilterSheet({
    super.key,
    required this.state,
    required this.onChangeFilter,
  });

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  late FilterState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 31),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Filter Search',
              style: TextStyles.smallerTextBold,
              textAlign: TextAlign.center,
            ),
          ),
          // ---------------------------------------------------------- //
          // 시간
          // ---------------------------------------------------------- //
          const SizedBox(height: 20),
          Text('Time', style: TextStyles.smallerTextBold),
          const SizedBox(height: 10),
          FilterButtons(
            items: ['All', 'Newest', 'Oldest', 'Popularity'],
            selectedItem: _state.time,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(time: item);
              });
            },
          ),

          // ---------------------------------------------------------- //
          // 평점
          // ---------------------------------------------------------- //
          const SizedBox(height: 20),
          Text('Rate', style: TextStyles.smallerTextBold),
          const SizedBox(height: 10),
          FilterButtons(
            items: ['5', '4', '3', '2', '1'],
            selectedItem: _state.rate.toString(),
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(rate: int.parse(item));
              });
            },
          ),
          const SizedBox(height: 20),

          // ---------------------------------------------------------- //
          // 카테고리
          // ---------------------------------------------------------- //
          Text('Category', style: TextStyles.smallerTextBold),
          const SizedBox(height: 10),
          FilterButtons(
            items: const [
              'All',
              'Cereal',
              'Vegetables',
              'Dinner',
              'Chinese',
              'Local Dish',
              'Fruit',
              'BreadFast',
              'Spanish',
              'Lunch',
            ],
            selectedItem: _state.category,
            onSelected: (String item) {
              setState(() {
                _state = _state.copyWith(category: item);
              });
            },
          ),

          // ---------------------------------------------------------- //
          // 필터버튼
          // ---------------------------------------------------------- //
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 174,
                child: SmallButton(
                  'Filter',
                  onPressed: () {
                    widget.onChangeFilter(_state);
                  },
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
