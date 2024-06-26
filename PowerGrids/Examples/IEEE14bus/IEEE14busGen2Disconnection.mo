within PowerGrids.Examples.IEEE14bus;
model IEEE14busGen2Disconnection "Simulation of the disconnection of generator 2 at t = 1 s"
  extends IEEE14busStaticNetwork(Tgen2(useBreaker = true));
  Modelica.Blocks.Sources.BooleanExpression Gen2BreakerState(y = time < 1)  annotation (
    Placement(visible = true, transformation(origin = {-154, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Gen2BreakerState.y, Tgen2.breakerStatusIn) annotation (
    Line(points={{-143,-76},{-124,-76},{-124,-88},{-129.2,-88}},        color = {255, 0, 255}));

annotation (
    Icon(coordinateSystem(grid={2,2}, extent={{-175,-100},{200,100}})),
    Diagram(coordinateSystem(extent={{-175,-100},{200,100}},      grid={2,2})),
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-6, Interval = 0.04),
   __OpenModelica_simulationFlags(homotopyOnFirstTry="()"));
end IEEE14busGen2Disconnection;
