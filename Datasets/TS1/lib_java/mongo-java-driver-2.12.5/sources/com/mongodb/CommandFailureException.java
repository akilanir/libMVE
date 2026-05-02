package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/CommandFailureException.class */
public class CommandFailureException extends MongoException {
    private static final long serialVersionUID = -1180715413196161037L;
    private final CommandResult commandResult;

    public CommandFailureException(CommandResult commandResult) {
        super(ServerError.getCode(commandResult), commandResult.toString());
        this.commandResult = commandResult;
    }

    public CommandResult getCommandResult() {
        return this.commandResult;
    }
}
