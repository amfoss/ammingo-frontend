import 'package:flutter/material.dart';
import 'bingo_board.dart';
import 'game_monitor.dart';

class EventDetails extends StatelessWidget {
  final String eventName;
  final String hostName;
  final String hostPfp;
  final String joinOrStart;
  final int duration;
  final String description;
  // final String calendar_date;
  // final String day;
  // final String mainLocation;
  // final String subLocation;

  const EventDetails({
    super.key,
    required this.eventName,
    required this.hostName,
    required this.hostPfp,
    required this.joinOrStart,
    required this.duration,
    required this.description,
    // required this.calendar_date,
    // required this.day,
    // required this.mainLocation,
    // required this.subLocation,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // sample data
    final List<EventDetail> details = [
      // EventDetail(
      //   icon: Icons.calendar_month,
      //   mainDetail: calendar_date,
      //   subDetail: day,
      // ),
      EventDetail(
        icon: Icons.timer,
        mainDetail: "Duration",
        subDetail: "$duration mins",
      ),
      EventDetail(
        icon: Icons.description,
        mainDetail: "Description",
        subDetail: description,
      ),
      // EventDetail(
      //   icon: Icons.location_on,
      //   mainDetail: "Amrita University",
      //   subDetail: "Main Auditorium",
      // ),
    ];

    return Scaffold(
      backgroundColor: colorScheme.surface,

      // APP BAR
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: colorScheme.surface,
        title: Text(
          "•  LIVE EVENT",
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // BODY
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // crowd gathering image
                Center(
                  child: SizedBox(
                    width: double.infinity,
                    height: height * 0.22,
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/crowd_gathering.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        Positioned(
                          bottom: 15,
                          left: 15,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.03,
                              vertical: height * 0.006,
                            ),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "SOCIAL BINGO",
                              style: textTheme.bodyMedium?.copyWith(
                                color: colorScheme.onPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: height * 0.03),

                // EVENT TITLE & HOST DETAILS
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Event Title
                    Text(
                      eventName,
                      style: textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.onSurface,
                      ),
                    ),

                    SizedBox(height: height * 0.01),

                    //Host Details
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: colorScheme.primary,
                              width: 2,
                            ),
                          ),
                          child: ClipOval(
                            child: Image.network(
                              hostPfp, // hostProfile img
                              width: 45,
                              height: 45,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Icon(Icons.person, size: 45),
                            ),
                          ),
                        ),

                        SizedBox(width: width * 0.025),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HOSTED BY",
                              style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.primary,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              hostName, // host name
                              style: textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: height * 0.03),

                Column(
                  children: details.map((item) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: DetailCard(
                        icon: item.icon,
                        mainDetail: item.mainDetail,
                        subDetail: item.subDetail,
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: height * 0.1),
              ],
            ),
          ),
        ),
      ),

      // BOTTOM PLAY BUTTON
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: height * 0.07,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (joinOrStart == 'PLAY' || joinOrStart == 'RESUME') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BingoBoard(
                        eventName:
                            'HacktoberFest', // to be fetched from backend
                        hostName: 'amFOSS', // to be fetched from backend
                        timelimit: duration,
                        description:
                            'Hacktober fest event description', // to be fetched from backend
                      ),
                    ),
                  );
                } else if (joinOrStart == 'START') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameMonitorScreen(
                        eventName: 'HacktoberFest 2026',
                        time: duration,
                        maxParticipants: '60',
                      ),
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                joinOrStart,
                style: textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.surface,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// CUSTOM WIDGET FOR DETAILS
class DetailCard extends StatelessWidget {
  final IconData icon;
  final String mainDetail;
  final String subDetail;

  const DetailCard({
    super.key,
    required this.icon,
    required this.mainDetail,
    required this.subDetail,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.9,
      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(
        color: colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: colorScheme.primary, size: 36),

          SizedBox(width: width * 0.04),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainDetail,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),

                const SizedBox(height: 6),

                Flexible(
                  child: Text(
                    subDetail,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Class for sample data
class EventDetail {
  final IconData icon;
  final String mainDetail;
  final String subDetail;

  EventDetail({
    required this.icon,
    required this.mainDetail,
    required this.subDetail,
  });
}
