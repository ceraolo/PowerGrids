within PowerGrids.Examples.ENTSOE;
model TestCase3 "Test Case 3, Section 5.3, focuses on the dynamic behavior of the model for the synchronous machine with its whole control in response to a short-circuit"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin = {36, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161146, UStart = 21e3 * 0.992, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {-16, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.Bus NTLV(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {-4, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Buses.BusFault NTHV(R = 0.05, SNom = 5e+08, UNom = 380000, UStart = 1.050 * 380e3, X = 0, portVariablesPhases = true, portVariablesPu = true, startTime = 0.1, stopTime = 0.2)  annotation (
    Placement(visible = true, transformation(origin = {36, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Branches.TransformerFixedRatio TGEN(PStartA = 4.75e+08, PStartB = -4.75e+08, QStartA = 1.56e+08, QStartB = -7.6e+07, R = 0.15e-2 * 419 ^ 2 / 500, SNom = 5e+08, UNomA = 21000, UNomB = 419000, UPhaseStartA = 0.161146, UPhaseStartB = 0, UStartA = 0.992 * 21e3, UStartB = 1.050 * 380e3, X = 16e-2 * 419 ^ 2 / 500, portVariablesPhases = true, portVariablesPu = true, rFixed = 419 / 21)  annotation (
    Placement(visible = true, transformation(origin = {16, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1)  annotation (
    Placement(visible = true, transformation(origin = {-52, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4)  annotation (
    Placement(visible = true, transformation(origin = {-50, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1)  annotation (
    Placement(visible = true, transformation(origin = {-88, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation (
    Placement(visible = true, transformation(origin = {-92, -48}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = 1.004552)  annotation (
    Placement(visible = true, transformation(origin = {-92, -31}, extent = {{-12, -11}, {12, 11}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 475 / 500 * 0.05)  annotation (
    Placement(visible = true, transformation(origin = {-88, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Loads.LoadImpedancePQ GRIDL(PRef = 4.75e+08, QRef = 7.6e+07, SNom = 5e+08, UNom = 380000, URef = 1.05 * 380e3, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {48, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.EquivalentGrid GRID(R_X = 1 / 10, SNom = 5e+08, SSC = 2.5e+09, UNom = 380000, URef = 1.050 * 380e3, c = 1.1, portVariablesPhases = true, portVariablesPu = true)  annotation (
    Placement(visible = true, transformation(origin = {64, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Types.PerUnit AA_01_GEN_Upu = GEN.port.VPu "Fig. 5.7, terminal voltage";
  Types.PerUnit AA_02_GEN_efd = GEN.ufPuIn "Fig. 5.8, excitation voltage";
  Types.PerUnit AA_03_GEN_Ppu = GEN.port.PGenPu/0.95 "Fig. 5.9, active power of the synchronous machine";
  Types.PerUnit AA_04_GEN_Qpu = GEN.port.QGenPu/0.314583 "Fig. 5.10, reactive power of the synchronous machine";
  Types.PerUnit AA_05_GEN_omegapu = GEN.omegaPu "Fig. 5.11, speed";
  Types.PerUnit AA_06_PSS_out = PSS.VstPu "Fig. 5.12, PSS output signal";
  Types.PerUnit AA_07_GRIDL_Ppu = GRIDL.port.PPu/0.95 "Fig. 5.13, active power of the load";
  Types.PerUnit AA_08_GRIDL_Qpu = GRIDL.port.QPu/0.1519 "Fig. 5.14, reactive power of the load";

equation
  connect(GRID.terminal, NTHV.terminal) annotation (
    Line(points = {{64, -22}, {28, -22}}));
  connect(VrefPu.y, AVR.VrefPu) annotation (
    Line(points = {{-78.8, -31}, {-75.8, -31}, {-75.8, -18}, {-60, -18}}, color = {0, 0, 127}));
  connect(TGEN.terminalB, NTHV.terminal) annotation (
    Line(points = {{26, -22}, {36, -22}}));
  connect(NTHV.terminal, GRIDL.terminal) annotation (
    Line(points = {{36, -22}, {48, -22}, {48, -38}}));
  connect(GEN.PPu, PSS.Vsi2Pu) annotation (
    Line(points = {{-6, -2}, {4, -2}, {4, 48}, {-110, 48}, {-110, -6}, {-98, -6}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation (
    Line(points = {{-6, -6}, {8, -6}, {8, 52}, {-114, 52}, {-114, -14}, {-60, -14}}, color = {0, 0, 127}));
  connect(RefLPu.y, TGOV.RefLPu) annotation (
    Line(points = {{-77, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation (
    Line(points = {{-78.8, -48}, {-69.8, -48}, {-69.8, -22}, {-60, -22}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation (
    Line(points = {{-6, 2}, {0, 2}, {0, 42}, {-106, 42}, {-106, 6}, {-98, 6}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation (
    Line(points = {{-77, 0}, {-66.5, 0}, {-66.5, -10}, {-60, -10}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation (
    Line(points = {{-39, -16}, {-34, -16}, {-34, -4}, {-26, -4}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation (
    Line(points = {{-6, 2}, {0, 2}, {0, 42}, {-74, 42}, {-74, 32}, {-62, 32}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation (
    Line(points = {{-41.82, 28}, {-33.82, 28}, {-33.82, 4}, {-29.82, 4}, {-29.82, 4}, {-25.82, 4}}, color = {0, 0, 127}));
  connect(NTLV.terminal, TGEN.terminalA) annotation (
    Line(points = {{-4, -22}, {6, -22}}));
  connect(GEN.terminal, NTLV.terminal) annotation (
    Line(points = {{-16, 0}, {-16, -22}, {-4, -22}}));
  annotation (
    Diagram(coordinateSystem(extent = {{-120, -60}, {80, 60}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));
end TestCase3;
