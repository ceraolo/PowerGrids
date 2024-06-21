within PowerGrids.Examples.ENTSOE;
model TestCase1 "Test Case 1, Section 5.1, focuses on the dynamic behavior of the model for the synchronous generator machine and its AVR"
  extends Modelica.Icons.Example;
  inner PowerGrids.Electrical.System systemPowerGrids annotation (
    Placement(visible = true, transformation(origin={18,24},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = 0, QStart = 0, SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0, UStart = 21000, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8) annotation (
    Placement(visible = true, transformation(origin={-28,-18},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Buses.ReferenceBus NTLV(SNom = 5e+08, UNom = 21000, portVariablesPhases = true, portVariablesPu = true) annotation (
    Placement(visible = true, transformation(origin={8,-36},     extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1) annotation (
    Placement(visible = true, transformation(origin = {-62, 10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VrMax = 4) annotation (
    Placement(visible = true, transformation(origin = {-62, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1) annotation (
    Placement(visible = true, transformation(origin = {-98, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation (
    Placement(visible = true, transformation(origin = {-102, -55}, extent = {{-12, -9}, {12, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPu(y = if time < 0.1 then 1.005 else 1.055) annotation (
    Placement(visible = true, transformation(origin = {-102, -43}, extent = {{-12, -9}, {12, 9}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression RefLPu(y = 0) annotation (
    Placement(visible = true, transformation(origin = {-98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Types.PerUnit AA_01_GEN_Upu = GEN.port.VPu "Fig. 5.1, terminal voltage";
  Types.PerUnit AA_02_GEN_efd = GEN.ufPuIn "Fig. 5.2, excitation voltage";


equation
  connect(GEN.PPu, PSS.Vsi2Pu) annotation (
    Line(points={{-18,-20},{-8,-20},{-8,30},{-122,30},{-122,-22},{-108.2,-22}},            color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation (
    Line(points={{-18,-24},{-4,-24},{-4,34},{-126,34},{-126,-32},{-72,-32}},            color = {0, 0, 127}));
  connect(RefLPu.y, TGOV.RefLPu) annotation (
    Line(points = {{-87, 6}, {-72, 6}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation (
    Line(points={{-88.8,-43},{-85.6,-43},{-85.6,-36},{-72,-36}},            color = {0, 0, 127}));
  connect(zero.y, AVR.VuelPu) annotation (
    Line(points={{-88.8,-55},{-79.6,-55},{-79.6,-40},{-72,-40}},            color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation (
    Line(points={{-18,-16},{-12,-16},{-12,26},{-118,26},{-118,-10},{-108,-10}},            color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation (
    Line(points = {{-87, -16}, {-76.5, -16}, {-76.5, -28}, {-72, -28}}, color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation (
    Line(points={{-51,-34},{-44,-34},{-44,-22},{-38,-22}},                                                              color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation (
    Line(points={{-18,-16},{-12,-16},{-12,26},{-86,26},{-86,14},{-72,14}},            color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation (
    Line(points={{-51.82,10},{-43.82,10},{-43.82,-14},{-38,-14}},                                           color = {0, 0, 127}));
  connect(GEN.terminal, NTLV.terminal) annotation (
    Line(points={{-28,-18},{-28,-36},{8,-36}}));
  annotation (
    Diagram(coordinateSystem(extent = {{-140, -60}, {40, 40}})),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-6, Interval = 0.004),
    __OpenModelica_commandLineOptions = "--daeMode --tearingMethod=minimalTearing",
    __OpenModelica_simulationFlags(nls="kinsol", lv="LOG_INIT_HOMOTOPY", homotopyOnFirstTry="()"));
end TestCase1;
