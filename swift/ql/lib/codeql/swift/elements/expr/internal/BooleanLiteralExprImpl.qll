private import codeql.swift.generated.expr.BooleanLiteralExpr

module Impl {
  /**
   * A boolean literal. For example `true` in:
   * ```
   * let x = true
   * ```
   */
  class BooleanLiteralExpr extends Generated::BooleanLiteralExpr {
    override string toStringImpl() { result = this.getValue().toString() }

    override string getValueString() { result = this.getValue().toString() }
  }
}
