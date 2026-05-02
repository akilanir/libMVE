.class public abstract Lorg/hamcrest/CustomTypeSafeMatcher;
.super Lorg/hamcrest/TypeSafeMatcher;
.source "CustomTypeSafeMatcher.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lorg/hamcrest/TypeSafeMatcher",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final fixedDescription:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .registers 4
    .param p1, "description"    # Ljava/lang/String;

    .prologue
    .line 28
    .local p0, "this":Lorg/hamcrest/CustomTypeSafeMatcher;, "Lorg/hamcrest/CustomTypeSafeMatcher<TT;>;"
    invoke-direct {p0}, Lorg/hamcrest/TypeSafeMatcher;-><init>()V

    .line 29
    if-nez p1, :cond_d

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Description must be non null!"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_d
    iput-object p1, p0, Lorg/hamcrest/CustomTypeSafeMatcher;->fixedDescription:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public final describeTo(Lorg/hamcrest/Description;)V
    .registers 3
    .param p1, "description"    # Lorg/hamcrest/Description;

    .prologue
    .line 37
    .local p0, "this":Lorg/hamcrest/CustomTypeSafeMatcher;, "Lorg/hamcrest/CustomTypeSafeMatcher<TT;>;"
    iget-object v0, p0, Lorg/hamcrest/CustomTypeSafeMatcher;->fixedDescription:Ljava/lang/String;

    invoke-interface {p1, v0}, Lorg/hamcrest/Description;->appendText(Ljava/lang/String;)Lorg/hamcrest/Description;

    .line 38
    return-void
.end method
