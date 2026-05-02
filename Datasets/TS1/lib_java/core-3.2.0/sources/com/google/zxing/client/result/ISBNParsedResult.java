package com.google.zxing.client.result;

/* loaded from: core-3.2.0.jar:com/google/zxing/client/result/ISBNParsedResult.class */
public final class ISBNParsedResult extends ParsedResult {
    private final String isbn;

    ISBNParsedResult(String isbn) {
        super(ParsedResultType.ISBN);
        this.isbn = isbn;
    }

    public String getISBN() {
        return this.isbn;
    }

    @Override // com.google.zxing.client.result.ParsedResult
    public String getDisplayResult() {
        return this.isbn;
    }
}
