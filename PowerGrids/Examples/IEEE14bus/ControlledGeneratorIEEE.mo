within PowerGrids.Examples.IEEE14bus;
model ControlledGeneratorIEEE "Model of controlled generator for the IEEE 14-bus benchmark - synchronous machine with proportional regulations"
  extends Icons.Machine;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(origin={-18,2},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Interfaces.TerminalA terminal annotation (Placement(
      visible=true,
      transformation(
        origin={-18,-26},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  PowerGrids.Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart / GEN.UNom, VrMax = 5, VrMin = -5)  annotation (
    Placement(visible = true, transformation(origin={-56,-8},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Electrical.Controls.TurbineGovernors.GoverProportional GOV(KGover = 5, PMaxPu = 1, PMinPu = 0, PPuStart = -GEN.PStart / GEN.PNom)  annotation (
    Placement(visible = true, transformation(origin={-52,32},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset PmRefPu(use_u = true)  annotation (
    Placement(visible = true, transformation(origin={-84,44},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PowerGrids.Controls.FreeOffset VrefPu(use_u = true)  annotation (
    Placement(visible = true, transformation(origin={-86,-20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1)  annotation (
    Placement(visible = true, transformation(origin={-120,-20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmRefPuDef(y = -GEN.PStart / GEN.PNom) annotation (
    Placement(visible = true, transformation(origin={-113,44},    extent = {{-13, -10}, {13, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega annotation (
    Placement(visible = true, transformation(origin={30,18},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.terminal, terminal) annotation (
    Line(points={{-18,2},{-18,-26}}));
  connect(GOV.omegaPu, GEN.omegaPu) annotation (
    Line(points={{-62,28},{-132,28},{-132,64},{6,64},{6,4},{-8,4}},                 color = {0, 0, 127}));
  connect(AVR.VcPu, GEN.VPu) annotation (
    Line(points={{-65.8,-2},{-137.8,-2},{-137.8,68},{12.2,68},{12.2,-4},{-8,-4}},               color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation (
    Line(points={{-45.8,-8},{-35.8,-8},{-35.8,-2},{-28,-2}},            color = {0, 0, 127}));
  connect(GOV.PMechPu, GEN.PmPu) annotation (
    Line(points={{-42,32},{-36,32},{-36,6},{-28,6}},          color = {0, 0, 127}));
  connect(PmRefPu.y, GOV.PmRefPu) annotation (
    Line(points={{-73,44},{-69,44},{-69,36},{-62,36}},                     color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation (
    Line(points={{-75,-20},{-73,-20},{-73,-14},{-65.8,-14}},                    color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation (
    Line(points={{-109,-20},{-97,-20}},                                 color = {0, 0, 127}));
  connect(GEN.PPu, GOV.PPu) annotation (
    Line(points={{-8,0},{10,0},{10,66},{-134,66},{-134,14},{-46,14},{-46,22}},               color = {0, 0, 127}));
  connect(PmRefPuDef.y, PmRefPu.u) annotation (
    Line(points={{-98.7,44},{-95,44}},          color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation (
    Line(points={{-7.9,7.9},{0.1,7.9},{0.1,18},{30,18}},                   color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent={{-140,-40},{40,80}}),           graphics={  Text(origin = {12, -74}, extent = {{-58, 10}, {34, -4}}, textString = "CONTROL"), Rectangle(origin = {0, -70}, extent = {{-50, 10}, {50, -10}})}),
  Diagram(coordinateSystem(extent={{-140,-40},{40,80}})),
  version = "",
  uses);
end ControlledGeneratorIEEE;
