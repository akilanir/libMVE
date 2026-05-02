.class public Lezvcard/Warning;
.super Ljava/lang/Object;
.source "Warning.java"


# instance fields
.field private final code:Ljava/lang/Integer;

.field private final message:Ljava/lang/String;


# direct methods
.method public varargs constructor <init>(I[Ljava/lang/Object;)V
    .registers 5
    .param p1, "code"    # I
    .param p2, "args"    # [Ljava/lang/Object;

    .prologue
    .line 51
    sget-object v0, Lezvcard/Messages;->INSTANCE:Lezvcard/Messages;

    invoke-virtual {v0, p1, p2}, Lezvcard/Messages;->getValidationWarning(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lezvcard/Warning;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lezvcard/Warning;-><init>(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Integer;)V
    .registers 3
    .param p1, "message"    # Ljava/lang/String;
    .param p2, "code"    # Ljava/lang/Integer;

    .prologue
    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    iput-object p2, p0, Lezvcard/Warning;->code:Ljava/lang/Integer;

    .line 61
    iput-object p1, p0, Lezvcard/Warning;->message:Ljava/lang/String;

    .line 62
    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/Integer;
    .registers 2

    .prologue
    .line 69
    iget-object v0, p0, Lezvcard/Warning;->code:Ljava/lang/Integer;

    return-object v0
.end method

.method public getMessage()Ljava/lang/String;
    .registers 2

    .prologue
    .line 77
    iget-object v0, p0, Lezvcard/Warning;->message:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .prologue
    .line 82
    iget-object v0, p0, Lezvcard/Warning;->code:Ljava/lang/Integer;

    if-nez v0, :cond_7

    .line 83
    iget-object v0, p0, Lezvcard/Warning;->message:Ljava/lang/String;

    .line 85
    :goto_6
    return-object v0

    :cond_7
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lezvcard/Warning;->code:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lezvcard/Warning;->message:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method
