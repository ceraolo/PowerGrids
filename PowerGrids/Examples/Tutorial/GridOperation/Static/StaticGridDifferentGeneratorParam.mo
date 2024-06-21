within PowerGrids.Examples.Tutorial.GridOperation.Static;
model StaticGridDifferentGeneratorParam "Systems operating in steady-state with different generator parameterss"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin={93.5, 64},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));

// First Grid
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_1(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin={-47.5, 50},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_1(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={-22.5, 34},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_1(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={9.5, 34},  extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_1(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161156, UPhaseStartB = 0, UStartA = 0.9917 * 21e3, UStartB = 0.95227 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-7, 34},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_1(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={47.5, 48},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_1(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={45.5, 22},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_1(y = -GEN_1.PStart / GEN_1.SNom)  annotation (
    Placement(visible = true, transformation(origin={-87.5, 54},  extent = {{-20, -10}, {20, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_1(y = GEN_1.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin={-89.5, 35},  extent = {{-18, -10}, {18, 10}}, rotation = 0)));
  // Second Grid - Transformer nominal voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN_2(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, excitationPuType = PowerGrids.Types.Choices.ExcitationPuType.Kundur, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin={-47.5, -6},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_2(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={-22.5, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_2(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={11.5, -22},    extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_2(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161156, UPhaseStartB = 0, UStartA = 0.9917 * 21e3, UStartB = 0.95227 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-6.5, -22},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_2(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={49.5, -12},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_2(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={45.5, -30},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_2(y = -GEN_2.PStart / GEN_2.SNom)  annotation (
    Placement(visible = true, transformation(origin={-89.5, -2},  extent = {{-18, -10}, {18, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_2(y = GEN_2.ufPuInStart)  annotation (
    Placement(visible = true, transformation(origin={-89.5, -21},  extent = {{-18, -10}, {18, 10}}, rotation = 0)));

// Third Grid - Generator Nominal Voltage changed
  PowerGrids.Electrical.Machines.SynchronousMachine4WindingsInternalParameters GEN_3(H = 4, LDPu = 0.2, LQ1Pu = 0.444231, LQ2Pu = 0.2625, LdPu = 0.15, LfPu = 0.224242, LqPu = 0.15, MdPu = 1.85, MqPu = 1.65, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, mrcPu = 0, portVariablesPhases = true, rDPu = 0.0303152, rQ1Pu = 0.00308618, rQ2Pu = 0.0234897, raPu = 0, rfPu = 0.00128379)  annotation (
    Placement(visible = true, transformation(origin={-47.5, -62},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV_3(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={-22.5, -78},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.Bus NTHV_3(SNom = 5e+08, UNom = 380000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={13.5, -78},  extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN_3(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161156, UPhaseStartB = 0, UStartA = 0.9917 * 21e3, UStartB = 0.95227 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin={-4.5, -78},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID_3(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={49.5, -68},  extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL_3(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin={47.5, -90},  extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression PmPu_3(y = 0.95)  annotation (
    Placement(visible = true, transformation(origin={-88.5, -58},  extent = {{-17, -10}, {17, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression ufPuIn_3(y = 2.50826)  annotation (
    Placement(visible = true, transformation(origin={-88.5, -76.5},extent = {{-17, -10}, {17, 10}}, rotation = 0)));
equation
  connect(PmPu_1.y, GEN_1.PmPu) annotation (
    Line(points = {{-65.5, 54}, {-57.5, 54}}, color = {0, 0, 127}));
  connect(ufPuIn_1.y, GEN_1.ufPuIn) annotation (
    Line(points = {{-69.7, 35}, {-64.2, 35}, {-64.2, 46}, {-57.2, 46}}, color = {0, 0, 127}));
  connect(PmPu_2.y, GEN_2.PmPu) annotation (
    Line(points = {{-69.7, -2}, {-57.2, -2}}, color = {0, 0, 127}));
  connect(ufPuIn_2.y, GEN_2.ufPuIn) annotation (
    Line(points = {{-69.7, -21}, {-63.2, -21}, {-63.2, -10}, {-57.2, -10}}, color = {0, 0, 127}));
  connect(PmPu_3.y, GEN_3.PmPu) annotation (
    Line(points = {{-69.8, -58}, {-57.3, -58}}, color = {0, 0, 127}));
  connect(ufPuIn_3.y, GEN_3.ufPuIn) annotation (
    Line(points = {{-69.8, -76.5}, {-63.8, -76.5}, {-63.8, -65.5}, {-60.8, -65.5}, {-60.8, -66}, {-57.3, -66}}, color = {0, 0, 127}));
  connect(GEN_1.terminal, NTLV_1.terminal) annotation (
    Line(points = {{-47.5, 50}, {-47.5, 34}, {-22.5, 34}}));
  connect(NTLV_1.terminal, TGEN_1.terminalA) annotation (
    Line(points = {{-22.5, 34}, {-17, 34}}));
  connect(TGEN_1.terminalB, NTHV_1.terminal) annotation (
    Line(points = {{3, 34}, {9.5, 34}}));
  connect(NTHV_1.terminal, GRID_1.terminal) annotation (
    Line(points = {{9.5, 34}, {33.5, 34}, {33.5, 48}, {47.5, 48}}));
  connect(NTHV_1.terminal, GRIDL_1.terminal) annotation (
    Line(points = {{9.5, 34}, {27.5, 34}, {27.5, 22}, {45.5, 22}}));
  connect(GEN_2.terminal, NTLV_2.terminal) annotation (
    Line(points = {{-47.5, -6}, {-47.5, -22}, {-22.5, -22}}));
  connect(NTLV_2.terminal, TGEN_2.terminalA) annotation (
    Line(points = {{-22.5, -22}, {-16.5, -22}}));
  connect(TGEN_2.terminalB, NTHV_2.terminal) annotation (
    Line(points = {{3.5, -22}, {11.5, -22}}));
  connect(NTHV_2.terminal, GRID_2.terminal) annotation (
    Line(points = {{11.5, -22}, {33.5, -22}, {33.5, -12}, {49.5, -12}}));
  connect(GEN_3.terminal, NTLV_3.terminal) annotation (
    Line(points = {{-47.5, -62}, {-47.5, -78}, {-22.5, -78}}));
  connect(NTLV_3.terminal, TGEN_3.terminalA) annotation (
    Line(points = {{-22.5, -78}, {-14.5, -78}}));
  connect(TGEN_3.terminalB, NTHV_3.terminal) annotation (
    Line(points = {{5.5, -78}, {13.5, -78}}));
  connect(NTHV_3.terminal, GRID_3.terminal) annotation (
    Line(points = {{13.5, -78}, {33, -78}, {33, -68}, {49.5, -68}}));
  connect(GRIDL_2.terminal, NTHV_2.terminal) annotation (
    Line(points = {{45.5, -30}, {28.75, -30}, {28.75, -22}, {11.5, -22}}));
  connect(GRIDL_3.terminal, NTHV_3.terminal) annotation (
    Line(points = {{47.5, -90}, {28, -90}, {28, -78}, {13.5, -78}}));

annotation (
     experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),
    Diagram(coordinateSystem(extent={{-120,-100},{120,80}},      grid={2,2}),        graphics={Text(origin = {96.5, 28}, extent = {{-33, 4}, {17, -6}}, textString = "generator Pu: E=1\nwhen U=Unom and I=0"), Text(origin = {104.5, -68}, extent = {{-37, 4}, {5, -16}}, textString = "generator parameters:
physical"), Text(origin = {114.5, -6}, extent = {{-49, 4}, {-3, -26}}, textString = "generator Pu: Kundur")}),
    Icon(coordinateSystem(extent={{-100,-100},{100,100}}, grid={2,2})));
end StaticGridDifferentGeneratorParam;
