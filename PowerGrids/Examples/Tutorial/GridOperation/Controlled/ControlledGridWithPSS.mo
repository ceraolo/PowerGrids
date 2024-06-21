within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGridWithPSS "System under automatic control including PSS"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {38, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {0, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161156, UPhaseStartB = 0, UStartA = 0.9917 * 21e3, UStartB = 0.95227 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {20, -26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.05 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {66, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRefConst = 4.75e+08, QRefConst = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {60, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1)  annotation (
    Placement(visible = true, transformation(origin = {-52, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4)  annotation (
    Placement(visible = true, transformation(origin = {-52, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation (
    Placement(visible = true, transformation(origin = {-92, -52}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.004552)  annotation (
    Placement(visible = true, transformation(origin = {-92, -33}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 475 / 500 * 0.05)  annotation (
    Placement(visible = true, transformation(origin = {-88, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.BusFault NTHV(R = 0.05,SNom = 5e+08, UNom = 380000, UPhaseStart = 0, UStart = 1.050 * 380e3,portVariablesPhases = true, portVariablesPu = true, startTime = 2, stopTime = 2.1)  annotation (
    Placement(visible = true, transformation(origin = {40, -26}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1)  annotation (
    Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.terminal, NTLV.terminal) annotation (
    Line(points = {{-16, 0}, {-16, -26}, {0, -26}}));
  connect(NTLV.terminal, TGEN.terminalA) annotation (
    Line(points = {{0, -26}, {10, -26}}));
  connect(TGEN.terminalB, NTHV.terminal) annotation (
    Line(points = {{30, -26}, {40, -26}}));
  connect(NTHV.terminal, GRID.terminal) annotation (
    Line(points = {{40, -26}, {46, -26}, {46, -16}, {66, -16}, {66, -16}}));
  connect(NTHV.terminal, GRIDL.terminal) annotation (
    Line(points = {{40, -26}, {46, -26}, {46, -38}, {60, -38}, {60, -38}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation (
    Line(points = {{-77, 24}, {-65, 24}, {-65, 24}, {-63, 24}}, color = {0, 0, 127}));
  connect(AVR.VrefPu, VrefPu.y) annotation (
    Line(points = {{-62, -18}, {-70, -18}, {-70, -32}, {-78, -32}, {-78, -32}}, color = {0, 0, 127}));
  connect(AVR.VuelPu, zero.y) annotation (
    Line(points = {{-62, -22}, {-66, -22}, {-66, -52}, {-78, -52}, {-78, -52}}, color = {0, 0, 127}));
  connect(GEN.ufPuIn, AVR.efdPu) annotation (
    Line(points = {{-26, -4}, {-34, -4}, {-34, -16}, {-40, -16}, {-40, -16}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation (
    Line(points = {{-41.82, 28}, {-33.82, 28}, {-33.82, 4}, {-25.82, 4}, {-25.82, 4}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation (
    Line(points = {{-6, -6}, {10, -6}, {10, 54}, {-114, 54}, {-114, -14}, {-62, -14}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation (
    Line(points = {{-6, 2}, {0, 2}, {0, 44}, {-70, 44}, {-70, 32}, {-62, 32}, {-62, 32}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation (
    Line(points = {{-77, 0}, {-71, 0}, {-71, -10}, {-63, -10}, {-63, -10}}, color = {0, 0, 127}));
  connect(PSS.Vsi1Pu, GEN.omegaPu) annotation (
    Line(points = {{-98, 6}, {-106, 6}, {-106, 44}, {0, 44}, {0, 2}, {-6, 2}}, color = {0, 0, 127}));
  connect(PSS.Vsi2Pu, GEN.PPu) annotation (
    Line(points = {{-98.2, -6}, {-110.2, -6}, {-110.2, 48}, {3.79999, 48}, {3.79999, -2}, {-6.2, -2}}, color = {0, 0, 127}));

annotation (
    Icon(coordinateSystem(grid = {0.1, 0.1})),
  Diagram(coordinateSystem(extent = {{-120, 60}, {80, -60}}, grid = {0.5, 0.5})),
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-6, Interval = 0.02),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"),
  version = "",
  uses);
end ControlledGridWithPSS;
