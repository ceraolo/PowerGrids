within PowerGrids.Examples.Tutorial.GridOperation.Controlled;
model ControlledGenerator "Model of a synchronous generator with governor, AVR, and PSS"
  extends Icons.Machine;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(H = 4, PStart = -4.75e+08, QStart = -1.56e+08,SNom = 5e+08, Tpd0 = 5.143, Tppd0 = 0.042, Tppq0 = 0.083, Tpq0 = 2.16, UNom = 21000, UPhaseStart = 0.161156, UStart = 21e3 * 0.9917, portVariablesPhases = true, raPu = 0, xdPu = 2, xlPu = 0.15, xpdPu = 0.35, xppdPu = 0.25, xppqPu = 0.3, xpqPu = 0.5, xqPu = 1.8)  annotation (
    Placement(visible = true, transformation(origin = {48, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.TurbineGovernors.IEEE_TGOV1 TGOV(PMechPuStart = -GEN.PStart / GEN.SNom,R = 0.05, T1 = 0.5, T2 = 3, T3 = 10, VMax = 1)  annotation (
    Placement(visible = true, transformation(origin = {12, 28}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.IEEE_AC4A AVR(Ka = 200, Ta = 0.05, Tb = 10, Tc = 3, VcPuStart = GEN.UStart / GEN.UNom, VrMax = 4)  annotation (
    Placement(visible = true, transformation(origin = {12, -16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression zero annotation (
    Placement(visible = true, transformation(origin = {-28, -52}, extent = {{-12, -10}, {12, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.PowerSystemStabilizers.IEEE_PSS2A PSS(Ks1 = 10, Ks2 = 0.1564, M = 0, N = 0, T1 = 0.25, T2 = 0.03, T3 = 0.15, T4 = 0.015, T7 = 2, T8 = 0.5, T9 = 0.1, Tw1 = 2, Tw2 = 2, Tw3 = 2, Tw4 = 0, VstMax = 0.1, VstMin = -0.1)  annotation (
    Placement(visible = true, transformation(origin = {-24, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Interfaces.TerminalA terminal annotation (Placement(
      visible=true,
      transformation(
        origin={48,-30},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PowerGrids.Controls.FreeOffset RefLPu annotation (
    Placement(visible = true, transformation(origin = {-24, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset VrefPu annotation (
    Placement(visible = true, transformation(origin = {-26, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega "Angular frequency / (rad/s)" annotation (
    Placement(visible = true, transformation(origin = {72, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0), iconTransformation(origin = {70, 1.77636e-15}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.ufPuIn, AVR.efdPu) annotation (
    Line(points = {{38, -4}, {30, -4}, {30, -16}, {23, -16}}, color = {0, 0, 127}));
  connect(TGOV.PMechPu, GEN.PmPu) annotation (
    Line(points = {{22.18, 28}, {30.18, 28}, {30.18, 4}, {38.18, 4}}, color = {0, 0, 127}));
  connect(GEN.VPu, AVR.VcPu) annotation (
    Line(points = {{58, -6}, {94, -6}, {94, 52}, {-52, 52}, {-52, -14}, {2, -14}}, color = {0, 0, 127}));
  connect(PSS.VstPu, AVR.VsPu) annotation (
    Line(points = {{-13, 0}, {-6, 0}, {-6, -10}, {2, -10}}, color = {0, 0, 127}));
  connect(PSS.Vsi2Pu, GEN.PPu) annotation (
    Line(points = {{-34.2, -6}, {-48.2, -6}, {-48.2, 48}, {89.8, 48}, {89.8, -2}, {57.8, -2}}, color = {0, 0, 127}));
  connect(GEN.terminal, terminal) annotation (
    Line(points = {{48, 0}, {48, -30}}));
  connect(RefLPu.y, TGOV.RefLPu) annotation (
    Line(points = {{-13, 24}, {2, 24}}, color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation (
    Line(points = {{-15, -30}, {-10, -30}, {-10, -18}, {2, -18}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, TGOV.omegaPu) annotation (
    Line(points = {{58, 2}, {86, 2}, {86, 44}, {-6, 44}, {-6, 32}, {2, 32}}, color = {0, 0, 127}));
  connect(AVR.VuelPu, zero.y) annotation (
    Line(points = {{2, -22}, {-4, -22}, {-4, -52}, {-14, -52}, {-14, -52}}, color = {0, 0, 127}));
  connect(GEN.omegaPu, PSS.Vsi1Pu) annotation (
    Line(points = {{58, 2}, {86, 2}, {86, 44}, {-44, 44}, {-44, 6}, {-34, 6}}, color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation (
    Line(points = {{58.1, 5.9}, {62.1, 5.9}, {62.1, 11.9}, {72.1, 11.9}, {72.1, 11.9}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(grid = {0.1, 0.1}, initialScale = 0.1), graphics = {Text(origin = {12, -74}, extent = {{-58, 10}, {34, -4}}, textString = "CONTROL"), Rectangle(origin = {0, -70}, extent = {{-50, 10}, {50, -10}})}),
  Diagram(coordinateSystem(grid = {0.5, 0.5}, extent = {{-60, 60}, {100, -60}})),
  version = "",
  uses);
end ControlledGenerator;
