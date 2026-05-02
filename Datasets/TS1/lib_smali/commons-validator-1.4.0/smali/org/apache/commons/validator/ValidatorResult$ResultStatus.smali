.class public Lorg/apache/commons/validator/ValidatorResult$ResultStatus;
.super Ljava/lang/Object;
.source "ValidatorResult.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/validator/ValidatorResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "ResultStatus"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x38933a0dc63d41c7L


# instance fields
.field private result:Ljava/lang/Object;

.field private valid:Z


# direct methods
.method public constructor <init>(Lorg/apache/commons/validator/ValidatorResult;ZLjava/lang/Object;)V
    .registers 4
    .param p1, "ignored"    # Lorg/apache/commons/validator/ValidatorResult;
    .param p2, "valid"    # Z
    .param p3, "result"    # Ljava/lang/Object;

    .prologue
    .line 156
    invoke-direct {p0, p2, p3}, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;-><init>(ZLjava/lang/Object;)V

    .line 157
    return-void
.end method

.method public constructor <init>(ZLjava/lang/Object;)V
    .registers 4
    .param p1, "valid"    # Z
    .param p2, "result"    # Ljava/lang/Object;

    .prologue
    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->valid:Z

    .line 140
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->result:Ljava/lang/Object;

    .line 148
    iput-boolean p1, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->valid:Z

    .line 149
    iput-object p2, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->result:Ljava/lang/Object;

    .line 150
    return-void
.end method


# virtual methods
.method public getResult()Ljava/lang/Object;
    .registers 2

    .prologue
    .line 182
    iget-object v0, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->result:Ljava/lang/Object;

    return-object v0
.end method

.method public isValid()Z
    .registers 2

    .prologue
    .line 164
    iget-boolean v0, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->valid:Z

    return v0
.end method

.method public setResult(Ljava/lang/Object;)V
    .registers 2
    .param p1, "result"    # Ljava/lang/Object;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->result:Ljava/lang/Object;

    .line 193
    return-void
.end method

.method public setValid(Z)V
    .registers 2
    .param p1, "valid"    # Z

    .prologue
    .line 172
    iput-boolean p1, p0, Lorg/apache/commons/validator/ValidatorResult$ResultStatus;->valid:Z

    .line 173
    return-void
.end method
