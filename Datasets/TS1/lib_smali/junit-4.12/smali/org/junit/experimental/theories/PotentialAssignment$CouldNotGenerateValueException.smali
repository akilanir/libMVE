.class public Lorg/junit/experimental/theories/PotentialAssignment$CouldNotGenerateValueException;
.super Ljava/lang/Exception;
.source "PotentialAssignment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/experimental/theories/PotentialAssignment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CouldNotGenerateValueException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 14
    return-void
.end method
