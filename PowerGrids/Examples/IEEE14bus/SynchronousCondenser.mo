within PowerGrids.Examples.IEEE14bus;
model SynchronousCondenser "Model of a synchronous condenser for the IEEE-14 bus system"
  extends Icons.Machine;
  PowerGrids.Electrical.Machines.SynchronousMachine4Windings GEN(portVariablesPhases = true)  annotation (
    Placement(visible = true, transformation(                   extent={{8,-10},
            {28,10}},                                                                            rotation = 0)));
  PowerGrids.Interfaces.TerminalA terminal annotation (Placement(
      visible=true,
      transformation(
        origin={18,-32},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={0,0},
        extent={{-10,-10},{10,10}},
        rotation=0)));
  Electrical.Controls.ExcitationSystems.VRProportional AVR(Ka = 20, VcPuStart = GEN.UStart / GEN.UNom, VrMax = 5, VrMin = -5)  annotation (
    Placement(visible = true, transformation(origin={-26,-10},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Controls.FreeOffset VrefPu(use_u = true)  annotation (
    Placement(visible = true, transformation(origin={-56,-22},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression VrefPuDef(y = 1)  annotation (
    Placement(visible = true, transformation(origin={-86,-22},     extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression PmPu(y = 0) annotation (
    Placement(visible = true, transformation(origin={-26,20},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput omega annotation (
    Placement(visible = true, transformation(origin={54,16},    extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(GEN.terminal, terminal) annotation (
    Line(points={{18,0},{18,-32}}));
  connect(AVR.VcPu, GEN.VPu) annotation (
    Line(points={{-35.8,-4},{-54,-4},{-54,36},{70,36},{70,-6},{28,-6}},             color = {0, 0, 127}));
  connect(AVR.efdPu, GEN.ufPuIn) annotation (
    Line(points={{-15.8,-10},{-6,-10},{-6,-4},{8,-4}},                       color = {0, 0, 127}));
  connect(VrefPu.y, AVR.VrefPu) annotation (
    Line(points={{-45,-22},{-42,-22},{-42,-16},{-35.8,-16}},                    color = {0, 0, 127}));
  connect(VrefPuDef.y, VrefPu.u) annotation (
    Line(points={{-75,-22},{-67,-22}},        color = {0, 0, 127}));
  connect(GEN.omega, omega) annotation (
    Line(points={{28.1,5.9},{36,5.9},{36,16},{54,16}},               color = {0, 0, 127}));
  connect(PmPu.y, GEN.PmPu) annotation (
    Line(points={{-15,20},{-6,20},{-6,4},{8,4}},                        color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(extent={{-100,-40},{80,40}}),           graphics={  Text(origin = {12, -74}, extent = {{-58, 10}, {34, -4}}, textString = "CONTROL"), Rectangle(origin = {0, -70}, extent = {{-50, 10}, {50, -10}}), Text(origin = {-106, 0}, extent = {{-36, 40}, {36, -40}}, textString = "SC")}),
    Diagram(coordinateSystem(extent={{-100,-40},{80,40}})));
end SynchronousCondenser;
