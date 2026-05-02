.class final Lorg/acra/ErrorReporter$1;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Lorg/acra/ExceptionHandlerInitializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/acra/ErrorReporter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .prologue
    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initializeExceptionHandler(Lorg/acra/ErrorReporter;)V
    .registers 2
    .param p1, "reporter"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 113
    return-void
.end method
