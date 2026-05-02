.class public Lorg/jivesoftware/smack/packet/StreamError;
.super Ljava/lang/Object;
.source "StreamError.java"


# instance fields
.field private code:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "code"    # Ljava/lang/String;

    .prologue
    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Lorg/jivesoftware/smack/packet/StreamError;->code:Ljava/lang/String;

    .line 90
    return-void
.end method


# virtual methods
.method public getCode()Ljava/lang/String;
    .registers 2

    .prologue
    .line 98
    iget-object v0, p0, Lorg/jivesoftware/smack/packet/StreamError;->code:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 103
    .local v0, "txt":Ljava/lang/StringBuilder;
    const-string v1, "stream:error ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lorg/jivesoftware/smack/packet/StreamError;->code:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
