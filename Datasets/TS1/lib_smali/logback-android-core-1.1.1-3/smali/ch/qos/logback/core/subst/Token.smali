.class public Lch/qos/logback/core/subst/Token;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lch/qos/logback/core/subst/Token$Type;
    }
.end annotation


# static fields
.field public static final CURLY_LEFT_TOKEN:Lch/qos/logback/core/subst/Token;

.field public static final CURLY_RIGHT_TOKEN:Lch/qos/logback/core/subst/Token;

.field public static final DEFAULT_SEP_TOKEN:Lch/qos/logback/core/subst/Token;

.field public static final START_TOKEN:Lch/qos/logback/core/subst/Token;


# instance fields
.field payload:Ljava/lang/String;

.field type:Lch/qos/logback/core/subst/Token$Type;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v2, 0x0

    new-instance v0, Lch/qos/logback/core/subst/Token;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->START:Lch/qos/logback/core/subst/Token$Type;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/subst/Token;-><init>(Lch/qos/logback/core/subst/Token$Type;Ljava/lang/String;)V

    sput-object v0, Lch/qos/logback/core/subst/Token;->START_TOKEN:Lch/qos/logback/core/subst/Token;

    new-instance v0, Lch/qos/logback/core/subst/Token;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->CURLY_LEFT:Lch/qos/logback/core/subst/Token$Type;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/subst/Token;-><init>(Lch/qos/logback/core/subst/Token$Type;Ljava/lang/String;)V

    sput-object v0, Lch/qos/logback/core/subst/Token;->CURLY_LEFT_TOKEN:Lch/qos/logback/core/subst/Token;

    new-instance v0, Lch/qos/logback/core/subst/Token;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->CURLY_RIGHT:Lch/qos/logback/core/subst/Token$Type;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/subst/Token;-><init>(Lch/qos/logback/core/subst/Token$Type;Ljava/lang/String;)V

    sput-object v0, Lch/qos/logback/core/subst/Token;->CURLY_RIGHT_TOKEN:Lch/qos/logback/core/subst/Token;

    new-instance v0, Lch/qos/logback/core/subst/Token;

    sget-object v1, Lch/qos/logback/core/subst/Token$Type;->DEFAULT:Lch/qos/logback/core/subst/Token$Type;

    invoke-direct {v0, v1, v2}, Lch/qos/logback/core/subst/Token;-><init>(Lch/qos/logback/core/subst/Token$Type;Ljava/lang/String;)V

    sput-object v0, Lch/qos/logback/core/subst/Token;->DEFAULT_SEP_TOKEN:Lch/qos/logback/core/subst/Token;

    return-void
.end method

.method public constructor <init>(Lch/qos/logback/core/subst/Token$Type;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    iput-object p2, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p0, p1, :cond_5

    :cond_4
    :goto_4
    return v0

    :cond_5
    if-eqz p1, :cond_11

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_13

    :cond_11
    move v0, v1

    goto :goto_4

    :cond_13
    check-cast p1, Lch/qos/logback/core/subst/Token;

    iget-object v2, p0, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    iget-object v3, p1, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    if-eq v2, v3, :cond_1d

    move v0, v1

    goto :goto_4

    :cond_1d
    iget-object v2, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    if-eqz v2, :cond_2d

    iget-object v2, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    iget-object v3, p1, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4

    :goto_2b
    move v0, v1

    goto :goto_4

    :cond_2d
    iget-object v2, p1, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    if-eqz v2, :cond_4

    goto :goto_2b
.end method

.method public hashCode()I
    .registers 4

    const/4 v1, 0x0

    iget-object v0, p0, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    if-eqz v0, :cond_19

    iget-object v0, p0, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    invoke-virtual {v0}, Lch/qos/logback/core/subst/Token$Type;->hashCode()I

    move-result v0

    :goto_b
    mul-int/lit8 v0, v0, 0x1f

    iget-object v2, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    if-eqz v2, :cond_17

    iget-object v1, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_17
    add-int/2addr v0, v1

    return v0

    :cond_19
    move v0, v1

    goto :goto_b
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Token{type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Token;->type:Lch/qos/logback/core/subst/Token$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    if-eqz v1, :cond_38

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", payload=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lch/qos/logback/core/subst/Token;->payload:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_38
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
