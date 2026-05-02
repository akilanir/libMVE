.class public Lezvcard/io/text/VCardParseException;
.super Ljava/io/IOException;
.source "VCardParseException.java"


# instance fields
.field private final line:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 46
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Problem parsing vCard line: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 47
    iput-object p1, p0, Lezvcard/io/text/VCardParseException;->line:Ljava/lang/String;

    .line 48
    return-void
.end method


# virtual methods
.method public getLine()Ljava/lang/String;
    .registers 2

    .prologue
    .line 51
    iget-object v0, p0, Lezvcard/io/text/VCardParseException;->line:Ljava/lang/String;

    return-object v0
.end method
