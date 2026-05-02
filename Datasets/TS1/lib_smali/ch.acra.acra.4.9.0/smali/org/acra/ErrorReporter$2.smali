.class Lorg/acra/ErrorReporter$2;
.super Ljava/lang/Object;
.source "ErrorReporter.java"

# interfaces
.implements Lorg/acra/ExceptionHandlerInitializer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/acra/ErrorReporter;->setExceptionHandlerInitializer(Lorg/acra/ExceptionHandlerInitializer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/acra/ErrorReporter;


# direct methods
.method constructor <init>(Lorg/acra/ErrorReporter;)V
    .registers 2
    .param p1, "this$0"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 195
    iput-object p1, p0, Lorg/acra/ErrorReporter$2;->this$0:Lorg/acra/ErrorReporter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public initializeExceptionHandler(Lorg/acra/ErrorReporter;)V
    .registers 2
    .param p1, "reporter"    # Lorg/acra/ErrorReporter;

    .prologue
    .line 198
    return-void
.end method
