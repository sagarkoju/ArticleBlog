import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:vlogpost/Bloc/bloc/sign_in_bloc.dart';
import 'package:vlogpost/Bloc/switch_bloc.dart';
import 'package:vlogpost/Utils/app_theme_color.dart';
import 'package:vlogpost/screen/Animated_progress_indicator.dart';
import 'package:vlogpost/screen/alert_dialog.dart';
import 'package:vlogpost/screen/alphabetical_scroller.dart';
import 'package:vlogpost/screen/animated_icons.dart';
import 'package:vlogpost/screen/app_theme.dart';
import 'package:vlogpost/screen/back_drop_filter.dart';
import 'package:vlogpost/screen/badge.dart';
import 'package:vlogpost/screen/bottom_overflow.dart';
import 'package:vlogpost/screen/bottom_sheet.dart';
import 'package:vlogpost/screen/cascade_operator.dart';
import 'package:vlogpost/screen/checkbox.dart';
import 'package:vlogpost/screen/chip.dart';
import 'package:vlogpost/screen/cropper_image.dart';
import 'package:vlogpost/screen/cupertino_action_sheet.dart';
import 'package:vlogpost/screen/custom_painter.dart';
import 'package:vlogpost/screen/drawer.dart';
import 'package:vlogpost/screen/dropdown.dart';
import 'package:vlogpost/screen/duplicate_list.dart';
import 'package:vlogpost/screen/emoji_picker.dart';
import 'package:vlogpost/screen/expansion_panel.dart';
import 'package:vlogpost/screen/filter_search_list.dart';
import 'package:vlogpost/screen/fold_screen.dart';
import 'package:vlogpost/screen/future_builder.dart';
import 'package:vlogpost/screen/gridview.dart';
import 'package:vlogpost/screen/image_carasoul.dart';
import 'package:vlogpost/screen/image_picker.dart';
import 'package:vlogpost/screen/image_save_to_gallery.dart';
import 'package:vlogpost/screen/interactive_viewer.dart';
import 'package:vlogpost/screen/loading_spinner_button.dart';
import 'package:vlogpost/screen/navigation.dart';
import 'package:vlogpost/screen/page_view.dart';
import 'package:vlogpost/screen/paginated_datatable.dart';
import 'package:vlogpost/screen/popup_menu_button.dart';
import 'package:vlogpost/screen/read_data_localjson.dart';
import 'package:vlogpost/screen/remove_where.dart';
import 'package:vlogpost/screen/selectable_text.dart';
import 'package:vlogpost/screen/shimmer_effect.dart';
import 'package:vlogpost/screen/slidable.dart';
import 'package:vlogpost/screen/snackbar.dart';
import 'package:vlogpost/screen/spread_operator.dart';
import 'package:vlogpost/screen/stream_builder.dart';
import 'package:vlogpost/screen/visibility.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => SwitchBloc()),
      BlocProvider(create: (context) => SignInBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwitchBloc, SwitchState>(
      // bloc: SwitchBloc(),
      builder: (context, state) {
        return MaterialApp(
          theme: state.switchValue
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          debugShowCheckedModeBanner: false,
          home: const TextScreen(),
        );
      },
    );
  }
}

class TextScreen extends StatefulWidget {
  const TextScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<TextScreen> createState() => _TextScreenState();
}

class _TextScreenState extends State<TextScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime dateTime = DateTime.now();
  bool showDate = false;
  bool showTime = false;
  bool showDateTime = false;

  // Select for Date
  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  // Select for Time
  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }
  // select date time picker

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);

    // ignore: unnecessary_null_comparison
    if (date == null) return;

    final time = await _selectTime(context);

    // ignore: unnecessary_null_comparison
    if (time == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH: ss a').format(dateTime);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  Future<bool?> showAlert(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Do you want to exist the app"),
            backgroundColor: Colors.amber,
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text('Yes')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text("No"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showAlert(context);
        return shouldPop ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Blog Tutorial'),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ImageSaveScreen()));
                    },
                    child: const Text('Save Images'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BadgeScreen()));
                    },
                    child: const Text('Bagde in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LocalJsonScreen()));
                    },
                    child: const Text('Read Json data  flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const PaginatedDataTableScreen()));
                    },
                    child: const Text('Paginated Table in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const StreamScreen()));
                    },
                    child: const Text('Stream Builder in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ChipScreen()));
                    },
                    child: const Text('Chip in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ExpansionScreen()));
                    },
                    child: const Text('Expansion Tile'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const FutureBuilderScreen()));
                    },
                    child: const Text('Future Builder in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SlidableScreen()));
                    },
                    child: const Text('Slidable in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SwitchScreen()));
                    },
                    child: const Text('Switch using bloc'),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (_) => const QrCodeScreen()));
                //     },
                //     child: const Text('Qr code Scanner'),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const AlphabeticalScrollerWidegt()));
                    },
                    child: const Text('Alhabetical Scroller'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DuplicateListScreen()));
                    },
                    child: const Text('Checking Duplicate List'),
                  ),
                ),
                // Container(
                //   padding: const EdgeInsets.symmetric(horizontal: 15),
                //   width: double.infinity,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(context,
                //           MaterialPageRoute(builder: (_) => const URLScreen()));
                //     },
                //     child: const Text('Url launcher Screen'),
                //   ),
                // ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CupertinoScreen()));
                    },
                    child: const Text('Cupertino Action Sheet'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const EmojiScreen()));
                    },
                    child: const Text('Emoji Picker in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DrawerScreen()));
                    },
                    child: const Text('Drawer Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const BackDropScreen()));
                    },
                    child: const Text('Back Drop Filter in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SnackBarScreen()));
                    },
                    child: const Text('SnackBar in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AlertScreen()));
                    },
                    child: const Text('AlertDialog in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ImageCroppersScreens()));
                    },
                    child: const Text('Image Cropper in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ImageCarasoulScreen()));
                    },
                    child: const Text('Image Carasoul Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ImagePickerScreen()));
                    },
                    child: const Text('Image Picker in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BotttomShetScreen(
                                    widgetContext: context,
                                  )));
                    },
                    child: const Text('Bottom Sheet in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NavigationScreen()));
                    },
                    child: const Text('Navigation in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const InteractiveImageScreen()));
                    },
                    child: const Text('Interactive Image in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CascadeScreen()));
                    },
                    child: const Text('Cascade Operator in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CustomePainterScreen(
                                    progress: 0.5,
                                  )));
                    },
                    child: const Text('Custom Painter in flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()));
                    },
                    child: const Text('Bottom overflow'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const VisibilityScreen()));
                    },
                    child: const Text('Visibility Widget'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const DropDownScreen()));
                    },
                    child: const Text('DropDown in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CheckBoxScreen()));
                    },
                    child: const Text('CheckBox in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PageViewScreen()));
                    },
                    child: const Text('PageView in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const GridViewScreen()));
                    },
                    child: const Text('GridView in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PopMenuButtonScreen()));
                    },
                    child: const Text('PopupMenu Button in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const ShimmerScreen()));
                    },
                    child: const Text('Shimmer Effect'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SelectableTextScreen()));
                    },
                    child: const Text('Selectable Text'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SpreadOperatorScreen()));
                    },
                    child: const Text('Spread Operator in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  const LoadingSpinnerButtonScreen()));
                    },
                    child: const Text('Loading Spinner in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AnimatedProgressScreen()));
                    },
                    child: const Text('Animated Progress Button in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AnimatedIconScreen()));
                    },
                    child: const Text('Animated Icon in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const SearchFilterScreen()));
                    },
                    child: const Text('Filter ListView in Flutter'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const RemoveWhereScreem()));
                    },
                    child: const Text('Remove Where Method'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const FoldScreen()));
                    },
                    child: const Text('Fold Method'),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDate(context);
                      showDate = true;
                    },
                    child: const Text('Date Picker'),
                  ),
                ),
                showDate ? Center(child: Text(getDate())) : const SizedBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _selectTime(context);
                      showTime = true;
                    },
                    child: const Text('Timer Picker'),
                  ),
                ),
                showTime
                    ? Center(child: Text(getTime(selectedTime)))
                    : const SizedBox(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      _selectDateTime(context);
                      showDateTime = true;
                    },
                    child: const Text('Select Date and Time Picker'),
                  ),
                ),
                showDateTime
                    ? Center(child: Text(getDateTime()))
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
