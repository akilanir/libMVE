.class Lorg/junit/experimental/theories/PotentialAssignment$1;
.super Lorg/junit/experimental/theories/PotentialAssignment;
.source "PotentialAssignment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/theories/PotentialAssignment;->forValue(Ljava/lang/String;Ljava/lang/Object;)Lorg/junit/experimental/theories/PotentialAssignment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$name:Ljava/lang/String;

.field final synthetic val$value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 30
    iput-object p1, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$value:Ljava/lang/Object;

    iput-object p2, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$name:Ljava/lang/String;

    invoke-direct {p0}, Lorg/junit/experimental/theories/PotentialAssignment;-><init>()V

    return-void
.end method


# virtual methods
.method public getDescription()Ljava/lang/String;
    .registers 10

    .prologue
    const/4 v8, 0x2

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 33
    iget-object v2, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$value:Ljava/lang/Object;

    if-nez v2, :cond_18

    .line 34
    const-string v1, "null"

    .line 44
    .local v1, "valueString":Ljava/lang/String;
    :goto_9
    const-string v2, "%s <from %s>"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v1, v3, v6

    iget-object v4, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$name:Ljava/lang/String;

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 37
    .end local v1    # "valueString":Ljava/lang/String;
    :cond_18
    :try_start_18
    const-string v2, "\"%s\""

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$value:Ljava/lang/Object;

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_25
    .catch Ljava/lang/Throwable; {:try_start_18 .. :try_end_25} :catch_27

    move-result-object v1

    .restart local v1    # "valueString":Ljava/lang/String;
    goto :goto_9

    .line 38
    .end local v1    # "valueString":Ljava/lang/String;
    :catch_27
    move-exception v0

    .line 39
    .local v0, "e":Ljava/lang/Throwable;
    const-string v2, "[toString() threw %s: %s]"

    new-array v3, v8, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "valueString":Ljava/lang/String;
    goto :goto_9
.end method

.method public getValue()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 21
    iget-object v0, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$value:Ljava/lang/Object;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 5

    .prologue
    .line 26
    const-string v0, "[%s]"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/junit/experimental/theories/PotentialAssignment$1;->val$value:Ljava/lang/Object;

    aput-object v3, v1, v2

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
