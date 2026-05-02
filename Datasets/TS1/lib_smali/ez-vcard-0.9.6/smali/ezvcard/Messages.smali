.class public final enum Lezvcard/Messages;
.super Ljava/lang/Enum;
.source "Messages.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lezvcard/Messages;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lezvcard/Messages;

.field public static final enum INSTANCE:Lezvcard/Messages;


# instance fields
.field private final messages:Ljava/util/ResourceBundle;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .prologue
    const/4 v2, 0x0

    .line 37
    new-instance v0, Lezvcard/Messages;

    const-string v1, "INSTANCE"

    invoke-direct {v0, v1, v2}, Lezvcard/Messages;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    .line 36
    const/4 v0, 0x1

    new-array v0, v0, [Lezvcard/Messages;

    sget-object v1, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    aput-object v1, v0, v2

    sput-object v0, Lezvcard/Messages;->$VALUES:[Lezvcard/Messages;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 42
    const-string v0, "ezvcard/messages"

    invoke-static {v0}, Ljava/util/ResourceBundle;->getBundle(Ljava/lang/String;)Ljava/util/ResourceBundle;

    move-result-object v0

    iput-object v0, p0, Lezvcard/Messages;->messages:Ljava/util/ResourceBundle;

    .line 43
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lezvcard/Messages;
    .registers 2
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v0, Lezvcard/Messages;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lezvcard/Messages;

    return-object v0
.end method

.method public static values()[Lezvcard/Messages;
    .registers 1

    .prologue
    .line 36
    sget-object v0, Lezvcard/Messages;->$VALUES:[Lezvcard/Messages;

    invoke-virtual {v0}, [Lezvcard/Messages;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lezvcard/Messages;

    return-object v0
.end method


# virtual methods
.method public varargs getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    .registers 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 73
    :try_start_0
    iget-object v2, p0, Lezvcard/Messages;->messages:Ljava/util/ResourceBundle;

    invoke-virtual {v2, p1}, Ljava/util/ResourceBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 74
    .local v1, "message":Ljava/lang/String;
    invoke-static {v1, p2}, Ljava/text/MessageFormat;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_9
    .catch Ljava/util/MissingResourceException; {:try_start_0 .. :try_end_9} :catch_b

    move-result-object v2

    .line 76
    .end local v1    # "message":Ljava/lang/String;
    :goto_a
    return-object v2

    .line 75
    :catch_b
    move-exception v0

    .line 76
    .local v0, "e":Ljava/util/MissingResourceException;
    const/4 v2, 0x0

    goto :goto_a
.end method

.method public varargs getParseMessage(I[Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "code"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 62
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parse."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lezvcard/Messages;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public varargs getValidationWarning(I[Ljava/lang/Object;)Ljava/lang/String;
    .registers 5
    .param p1, "code"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 52
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "validate."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lezvcard/Messages;->getMessage(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
