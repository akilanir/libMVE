.class public Lcom/octo/android/robospice/persistence/exception/KeySanitationExcepion;
.super Lcom/octo/android/robospice/persistence/exception/SpiceException;
.source "KeySanitationExcepion.java"


# static fields
.field private static final serialVersionUID:J = 0xfd28079aa5fba36L


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 12
    const-string v0, "A problem occured during sanitation/desanitation of a key."

    invoke-direct {p0, v0}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;)V

    .line 13
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .registers 2
    .param p1, "arg0"    # Ljava/lang/String;

    .prologue
    .line 20
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;)V

    .line 21
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .registers 3
    .param p1, "arg0"    # Ljava/lang/String;
    .param p2, "arg1"    # Ljava/lang/Throwable;

    .prologue
    .line 16
    invoke-direct {p0, p1, p2}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 17
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 2
    .param p1, "arg0"    # Ljava/lang/Throwable;

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/octo/android/robospice/persistence/exception/SpiceException;-><init>(Ljava/lang/Throwable;)V

    .line 25
    return-void
.end method
