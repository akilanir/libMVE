package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DuplicateKeyException.class */
public class DuplicateKeyException extends WriteConcernException {
    private static final long serialVersionUID = -4415279469780082174L;

    DuplicateKeyException(CommandResult commandResult) {
        super(commandResult);
    }

    DuplicateKeyException(int code, CommandResult commandResult) {
        super(code, commandResult);
    }
}
