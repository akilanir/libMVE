.class Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;
.super Lorg/junit/runners/model/Statement;
.source "ExpectedException.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/rules/ExpectedException;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ExpectedExceptionStatement"
.end annotation


# instance fields
.field private final next:Lorg/junit/runners/model/Statement;

.field final synthetic this$0:Lorg/junit/rules/ExpectedException;


# direct methods
.method public constructor <init>(Lorg/junit/rules/ExpectedException;Lorg/junit/runners/model/Statement;)V
    .registers 3
    .param p2, "base"    # Lorg/junit/runners/model/Statement;

    .prologue
    .line 232
    iput-object p1, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->this$0:Lorg/junit/rules/ExpectedException;

    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 233
    iput-object p2, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->next:Lorg/junit/runners/model/Statement;

    .line 234
    return-void
.end method


# virtual methods
.method public evaluate()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 239
    :try_start_0
    iget-object v1, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->next:Lorg/junit/runners/model/Statement;

    invoke-virtual {v1}, Lorg/junit/runners/model/Statement;->evaluate()V
    :try_end_5
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_5} :catch_13

    .line 244
    iget-object v1, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->this$0:Lorg/junit/rules/ExpectedException;

    # invokes: Lorg/junit/rules/ExpectedException;->isAnyExceptionExpected()Z
    invoke-static {v1}, Lorg/junit/rules/ExpectedException;->access$100(Lorg/junit/rules/ExpectedException;)Z

    move-result v1

    if-eqz v1, :cond_12

    .line 245
    iget-object v1, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->this$0:Lorg/junit/rules/ExpectedException;

    # invokes: Lorg/junit/rules/ExpectedException;->failDueToMissingException()V
    invoke-static {v1}, Lorg/junit/rules/ExpectedException;->access$200(Lorg/junit/rules/ExpectedException;)V

    .line 247
    :cond_12
    :goto_12
    return-void

    .line 240
    :catch_13
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lorg/junit/rules/ExpectedException$ExpectedExceptionStatement;->this$0:Lorg/junit/rules/ExpectedException;

    # invokes: Lorg/junit/rules/ExpectedException;->handleException(Ljava/lang/Throwable;)V
    invoke-static {v1, v0}, Lorg/junit/rules/ExpectedException;->access$000(Lorg/junit/rules/ExpectedException;Ljava/lang/Throwable;)V

    goto :goto_12
.end method
