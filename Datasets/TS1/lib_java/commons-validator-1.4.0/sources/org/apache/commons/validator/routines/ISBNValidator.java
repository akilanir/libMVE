package org.apache.commons.validator.routines;

import java.io.Serializable;
import org.apache.commons.validator.routines.checkdigit.CheckDigitException;
import org.apache.commons.validator.routines.checkdigit.EAN13CheckDigit;
import org.apache.commons.validator.routines.checkdigit.ISBN10CheckDigit;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/routines/ISBNValidator.class */
public class ISBNValidator implements Serializable {
    private static final long serialVersionUID = 4319515687976420405L;
    private static final String SEP = "(?:\\-|\\s)";
    private static final String GROUP = "(\\d{1,5})";
    private static final String PUBLISHER = "(\\d{1,7})";
    private static final String TITLE = "(\\d{1,6})";
    static final String ISBN10_REGEX = "^(?:(\\d{9}[0-9X])|(?:(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9X])))$";
    static final String ISBN13_REGEX = "^(978|979)(?:(\\d{10})|(?:(?:\\-|\\s)(\\d{1,5})(?:\\-|\\s)(\\d{1,7})(?:\\-|\\s)(\\d{1,6})(?:\\-|\\s)([0-9])))$";
    private static final ISBNValidator ISBN_VALIDATOR = new ISBNValidator();
    private static final ISBNValidator ISBN_VALIDATOR_NO_CONVERT = new ISBNValidator(false);
    private CodeValidator isbn10Validator;
    private CodeValidator isbn13Validator;
    private final boolean convert;

    public static ISBNValidator getInstance() {
        return ISBN_VALIDATOR;
    }

    public static ISBNValidator getInstance(boolean convert) {
        return convert ? ISBN_VALIDATOR : ISBN_VALIDATOR_NO_CONVERT;
    }

    public ISBNValidator() {
        this(true);
    }

    public ISBNValidator(boolean convert) {
        this.isbn10Validator = new CodeValidator(ISBN10_REGEX, 10, ISBN10CheckDigit.ISBN10_CHECK_DIGIT);
        this.isbn13Validator = new CodeValidator(ISBN13_REGEX, 13, EAN13CheckDigit.EAN13_CHECK_DIGIT);
        this.convert = convert;
    }

    public boolean isValid(String code) {
        return isValidISBN13(code) || isValidISBN10(code);
    }

    public boolean isValidISBN10(String code) {
        return this.isbn10Validator.isValid(code);
    }

    public boolean isValidISBN13(String code) {
        return this.isbn13Validator.isValid(code);
    }

    public String validate(String code) {
        String result = validateISBN13(code);
        if (result == null) {
            result = validateISBN10(code);
            if (result != null && this.convert) {
                result = convertToISBN13(result);
            }
        }
        return result;
    }

    public String validateISBN10(String code) {
        Object result = this.isbn10Validator.validate(code);
        if (result == null) {
            return null;
        }
        return result.toString();
    }

    public String validateISBN13(String code) {
        Object result = this.isbn13Validator.validate(code);
        if (result == null) {
            return null;
        }
        return result.toString();
    }

    public String convertToISBN13(String isbn10) {
        if (isbn10 == null) {
            return null;
        }
        String input = isbn10.trim();
        if (input.length() != 10) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid length ").append(input.length()).append(" for '").append(input).append("'").toString());
        }
        String isbn13 = new StringBuffer().append("978").append(input.substring(0, 9)).toString();
        try {
            String checkDigit = this.isbn13Validator.getCheckDigit().calculate(isbn13);
            return new StringBuffer().append(isbn13).append(checkDigit).toString();
        } catch (CheckDigitException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Check digit error for '").append(input).append("' - ").append(e.getMessage()).toString());
        }
    }
}
