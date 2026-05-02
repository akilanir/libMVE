package org.apache.commons.validator;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/ISBNValidator.class */
public class ISBNValidator {
    public boolean isValid(String isbn) {
        return org.apache.commons.validator.routines.ISBNValidator.getInstance().isValidISBN10(isbn);
    }
}
