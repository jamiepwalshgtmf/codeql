/**
 * @kind path-problem
 */

// This query is for debugging InlineTaintTestFailures.
// The intended usage is
// 1. load the database of the failing test
// 2. run this query to see actual paths
// 3. if necessary, look at partial paths by (un)commenting appropriate lines
import python
import semmle.python.dataflow.new.DataFlow
import utils.test.dataflow.testConfig

module Config implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { TestConfig::isSource(source) }

  predicate isSink(DataFlow::Node source) { TestConfig::isSink(source) }
}

module Flows = DataFlow::Global<Config>;

import Flows::PathGraph

// int explorationLimit() { result = 5 }
// module FlowsPartial = Flows::FlowExplorationFwd<explorationLimit/0>;
// import FlowsPartial::PartialPathGraph
from Flows::PathNode source, Flows::PathNode sink
where Flows::flowPath(source, sink)
// from FlowsPartial::PartialPathNode source, FlowsPartial::PartialPathNode sink
// where FlowsPartial::partialFlow(source, sink, _)
select sink.getNode(), source, sink, "This node receives flow from $@.", source.getNode(),
  "this source"
