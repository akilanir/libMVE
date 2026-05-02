.class public Lfreemarker/template/SimpleDate;
.super Ljava/lang/Object;
.source "SimpleDate.java"

# interfaces
.implements Lfreemarker/template/TemplateDateModel;


# instance fields
.field private final date:Ljava/util/Date;

.field private final type:I


# direct methods
.method public constructor <init>(Ljava/sql/Date;)V
    .registers 3
    .param p1, "date"    # Ljava/sql/Date;

    .prologue
    .line 72
    const/4 v0, 0x2

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/sql/Time;)V
    .registers 3
    .param p1, "time"    # Ljava/sql/Time;

    .prologue
    .line 80
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    .line 81
    return-void
.end method

.method public constructor <init>(Ljava/sql/Timestamp;)V
    .registers 3
    .param p1, "datetime"    # Ljava/sql/Timestamp;

    .prologue
    .line 88
    const/4 v0, 0x3

    invoke-direct {p0, p1, v0}, Lfreemarker/template/SimpleDate;-><init>(Ljava/util/Date;I)V

    .line 89
    return-void
.end method

.method public constructor <init>(Ljava/util/Date;I)V
    .registers 5
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "type"    # I

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    if-nez p1, :cond_d

    .line 97
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "date == null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_d
    iput-object p1, p0, Lfreemarker/template/SimpleDate;->date:Ljava/util/Date;

    .line 100
    iput p2, p0, Lfreemarker/template/SimpleDate;->type:I

    .line 101
    return-void
.end method


# virtual methods
.method public getAsDate()Ljava/util/Date;
    .registers 2

    .prologue
    .line 104
    iget-object v0, p0, Lfreemarker/template/SimpleDate;->date:Ljava/util/Date;

    return-object v0
.end method

.method public getDateType()I
    .registers 2

    .prologue
    .line 108
    iget v0, p0, Lfreemarker/template/SimpleDate;->type:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 112
    iget-object v0, p0, Lfreemarker/template/SimpleDate;->date:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/util/Date;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
