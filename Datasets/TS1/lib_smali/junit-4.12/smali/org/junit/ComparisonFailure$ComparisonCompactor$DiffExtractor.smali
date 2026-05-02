.class Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;
.super Ljava/lang/Object;
.source "ComparisonFailure.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/ComparisonFailure$ComparisonCompactor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DiffExtractor"
.end annotation


# instance fields
.field private final sharedPrefix:Ljava/lang/String;

.field private final sharedSuffix:Ljava/lang/String;

.field final synthetic this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;


# direct methods
.method private constructor <init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;)V
    .registers 3

    .prologue
    .line 138
    iput-object p1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    # invokes: Lorg/junit/ComparisonFailure$ComparisonCompactor;->sharedPrefix()Ljava/lang/String;
    invoke-static {p1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$100(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 140
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    # invokes: Lorg/junit/ComparisonFailure$ComparisonCompactor;->sharedSuffix(Ljava/lang/String;)Ljava/lang/String;
    invoke-static {p1, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$200(Lorg/junit/ComparisonFailure$ComparisonCompactor;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 141
    return-void
.end method

.method synthetic constructor <init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;Lorg/junit/ComparisonFailure$1;)V
    .registers 3
    .param p1, "x0"    # Lorg/junit/ComparisonFailure$ComparisonCompactor;
    .param p2, "x1"    # Lorg/junit/ComparisonFailure$1;

    .prologue
    .line 131
    invoke-direct {p0, p1}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;-><init>(Lorg/junit/ComparisonFailure$ComparisonCompactor;)V

    return-void
.end method

.method private extractDiff(Ljava/lang/String;)Ljava/lang/String;
    .registers 6
    .param p1, "source"    # Ljava/lang/String;

    .prologue
    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public actualDiff()Ljava/lang/String;
    .registers 2

    .prologue
    .line 148
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->actual:Ljava/lang/String;
    invoke-static {v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$400(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->extractDiff(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public compactPrefix()Ljava/lang/String;
    .registers 5

    .prologue
    .line 152
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I
    invoke-static {v1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    move-result v1

    if-gt v0, v1, :cond_11

    .line 153
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    .line 155
    :goto_10
    return-object v0

    :cond_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    iget-object v2, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedPrefix:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I
    invoke-static {v3}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public compactSuffix()Ljava/lang/String;
    .registers 5

    .prologue
    .line 159
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I
    invoke-static {v1}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    move-result v1

    if-gt v0, v1, :cond_11

    .line 160
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    .line 162
    :goto_10
    return-object v0

    :cond_11
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->sharedSuffix:Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->contextLength:I
    invoke-static {v3}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$500(Lorg/junit/ComparisonFailure$ComparisonCompactor;)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "..."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_10
.end method

.method public expectedDiff()Ljava/lang/String;
    .registers 2

    .prologue
    .line 144
    iget-object v0, p0, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->this$0:Lorg/junit/ComparisonFailure$ComparisonCompactor;

    # getter for: Lorg/junit/ComparisonFailure$ComparisonCompactor;->expected:Ljava/lang/String;
    invoke-static {v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor;->access$300(Lorg/junit/ComparisonFailure$ComparisonCompactor;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/junit/ComparisonFailure$ComparisonCompactor$DiffExtractor;->extractDiff(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
