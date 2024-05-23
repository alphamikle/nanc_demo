import 'package:flutter/material.dart';
import 'package:nui/nui.dart';

void main() {
  runApp(const MyApp());
}

final DataStorage globalDataStorage = DataStorage(data: {'counter': 0});

final EventHandler counterHandler = EventHandler(
  test: (BuildContext context, Event event) => event.event == 'increment',
  handler: (BuildContext context, Event event) => globalDataStorage.updateValue(
    'counter',
    (globalDataStorage.getTypedValue<int>(query: 'counter') ?? 0) + 1,
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DataStorageProvider(
      dataStorage: globalDataStorage,
      child: EventDelegate(
        handlers: [
          counterHandler,
        ],
        child: MaterialApp(
          title: 'Nui App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Nui Counter'),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    super.key,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: NuiStackWidget(
          renderers: const [],
          imageErrorBuilder: null,
          imageFrameBuilder: null,
          imageLoadingBuilder: null,
          binary: null,
          nodes: null,
          xmlContent: '''
<center>
  <column mainAxisSize="min">
    <text size="18" align="center">
      You have pushed the button\nthis many times:
    </text>
    <dataBuilder buildWhen="counter">
      <text size="32">
        {{ data.counter }}
      </text>
    </dataBuilder>
  </column>
</center>

<positioned right="16" bottom="16">
  <physicalModel elevation="8" shadowColor="black" clip="antiAliasWithSaveLayer">
    <prop:borderRadius all="16"/>
    <material type="button" color="EBDEFF">
      <prop:borderRadius all="16"/>
      <inkWell onPressed="increment">
        <prop:borderRadius all="16"/>
        <tooltip text="Increment">
          <sizedBox size="56">
            <center>
              <icon icon="mdi_plus" color="21103E"/>
            </center>
          </sizedBox>
        </tooltip>
      </inkWell>
    </material>
  </physicalModel>
</positioned>
''',
          pageData: {},
        ),
      ),
    );
  }
}
