/// Capable of validating validation data or throwing a validation error.
/// Use this protocol to organize code for creating `Validation`s.
///
///     let validation: Validation = MyValidator().validation()
///
/// See `Validation` for more information.
public protocol ValidatorType {
    /// Data type to validate.
    associatedtype ValidationData

    /// Suitable for placing after `is` _and_ `is not`.
    ///
    ///     is alphanumeric
    ///     is not alphanumeric
    ///
    var validatorReadable: String { get }

    /// Validates the supplied `ValidationData`, throwing an error if it is not valid.
    ///
    /// - parameters:
    ///     - data: `ValidationData` to validate.
    /// - throws: `ValidationError` if the data is not valid, or another error if something fails.
    func validate(_ data: ValidationData) throws
}


extension ValidatorType {
    /// Create a `Validation` for this `Validator`.
    public func validator() -> Validator<ValidationData> {
        return Validator(validatorReadable, validate)
    }
}
