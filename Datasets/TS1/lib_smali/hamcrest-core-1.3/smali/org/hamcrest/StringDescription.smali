.class public Lorg/hamcrest/StringDescription;
.super Lorg/hamcrest/BaseDescription;
.source "StringDescription.java"


# instance fields
.field private final out:Ljava/lang/Appendable;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-direct {p0, v0}, Lorg/hamcrest/StringDescription;-><init>(Ljava/lang/Appendable;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/Appendable;)V
    .registers 2
    .param p1, "out"    # Ljava/lang/Appendable;

    .prologue
    .line 15
    invoke-direct {p0}, Lorg/hamcrest/BaseDescription;-><init>()V

    .line 16
    iput-object p1, p0, Lorg/hamcrest/StringDescription;->out:Ljava/lang/Appendable;

    .line 17
    return-void
.end method

.method public static asString(Lorg/hamcrest/SelfDescribing;)Ljava/lang/String;
    .registers 2
    .param p0, "selfDescribing"    # Lorg/hamcrest/SelfDescribing;

    .prologue
    .line 35
    invoke-static {p0}, Lorg/hamcrest/StringDescription;->toString(Lorg/hamcrest/SelfDescribing;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static toString(Lorg/hamcrest/SelfDescribing;)Ljava/lang/String;
    .registers 2
    .param p0, "selfDescribing"    # Lorg/hamcrest/SelfDescribing;

    .prologue
    .line 28
    new-instance v0, Lorg/hamcrest/StringDescription;

    invoke-direct {v0}, Lorg/hamcrest/StringDescription;-><init>()V

    invoke-virtual {v0, p0}, Lorg/hamcrest/StringDescription;->appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method protected append(C)V
    .registers 5
    .param p1, "c"    # C

    .prologue
    .line 50
    :try_start_0
    iget-object v1, p0, Lorg/hamcrest/StringDescription;->out:Ljava/lang/Appendable;

    invoke-interface {v1, p1}, Ljava/lang/Appendable;->append(C)Ljava/lang/Appendable;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 54
    return-void

    .line 51
    :catch_6
    move-exception v0

    .line 52
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not write description"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected append(Ljava/lang/String;)V
    .registers 5
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 41
    :try_start_0
    iget-object v1, p0, Lorg/hamcrest/StringDescription;->out:Ljava/lang/Appendable;

    invoke-interface {v1, p1}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_5} :catch_6

    .line 45
    return-void

    .line 42
    :catch_6
    move-exception v0

    .line 43
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not write description"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 61
    iget-object v0, p0, Lorg/hamcrest/StringDescription;->out:Ljava/lang/Appendable;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
