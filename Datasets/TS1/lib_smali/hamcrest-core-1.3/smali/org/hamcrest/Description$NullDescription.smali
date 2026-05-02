.class public final Lorg/hamcrest/Description$NullDescription;
.super Ljava/lang/Object;
.source "Description.java"

# interfaces
.implements Lorg/hamcrest/Description;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/hamcrest/Description;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "NullDescription"
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public appendDescriptionOf(Lorg/hamcrest/SelfDescribing;)Lorg/hamcrest/Description;
    .registers 2
    .param p1, "value"    # Lorg/hamcrest/SelfDescribing;

    .prologue
    .line 53
    return-object p0
.end method

.method public appendList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;
    .registers 5
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<+",
            "Lorg/hamcrest/SelfDescribing;",
            ">;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 59
    .local p4, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<+Lorg/hamcrest/SelfDescribing;>;"
    return-object p0
.end method

.method public appendText(Ljava/lang/String;)Lorg/hamcrest/Description;
    .registers 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 64
    return-object p0
.end method

.method public appendValue(Ljava/lang/Object;)Lorg/hamcrest/Description;
    .registers 2
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 69
    return-object p0
.end method

.method public appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Iterable;)Lorg/hamcrest/Description;
    .registers 5
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/Iterable",
            "<TT;>;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 81
    .local p4, "values":Ljava/lang/Iterable;, "Ljava/lang/Iterable<TT;>;"
    return-object p0
.end method

.method public varargs appendValueList(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)Lorg/hamcrest/Description;
    .registers 5
    .param p1, "start"    # Ljava/lang/String;
    .param p2, "separator"    # Ljava/lang/String;
    .param p3, "end"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "[TT;)",
            "Lorg/hamcrest/Description;"
        }
    .end annotation

    .prologue
    .line 75
    .local p4, "values":[Ljava/lang/Object;, "[TT;"
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 86
    const-string v0, ""

    return-object v0
.end method
