.class public final Lfreemarker/template/SimpleNumber;
.super Ljava/lang/Object;
.source "SimpleNumber.java"

# interfaces
.implements Lfreemarker/template/TemplateNumberModel;
.implements Ljava/io/Serializable;


# instance fields
.field private value:Ljava/lang/Number;


# direct methods
.method public constructor <init>(B)V
    .registers 3
    .param p1, "val"    # B

    .prologue
    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    new-instance v0, Ljava/lang/Byte;

    invoke-direct {v0, p1}, Ljava/lang/Byte;-><init>(B)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 79
    return-void
.end method

.method public constructor <init>(D)V
    .registers 4
    .param p1, "val"    # D

    .prologue
    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    new-instance v0, Ljava/lang/Double;

    invoke-direct {v0, p1, p2}, Ljava/lang/Double;-><init>(D)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 99
    return-void
.end method

.method public constructor <init>(F)V
    .registers 3
    .param p1, "val"    # F

    .prologue
    .line 93
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 94
    new-instance v0, Ljava/lang/Float;

    invoke-direct {v0, p1}, Ljava/lang/Float;-><init>(F)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 95
    return-void
.end method

.method public constructor <init>(I)V
    .registers 3
    .param p1, "val"    # I

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 87
    return-void
.end method

.method public constructor <init>(J)V
    .registers 4
    .param p1, "val"    # J

    .prologue
    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 90
    new-instance v0, Ljava/lang/Long;

    invoke-direct {v0, p1, p2}, Ljava/lang/Long;-><init>(J)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 91
    return-void
.end method

.method public constructor <init>(Ljava/lang/Number;)V
    .registers 2
    .param p1, "value"    # Ljava/lang/Number;

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-object p1, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 75
    return-void
.end method

.method public constructor <init>(S)V
    .registers 3
    .param p1, "val"    # S

    .prologue
    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/lang/Short;

    invoke-direct {v0, p1}, Ljava/lang/Short;-><init>(S)V

    iput-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    .line 83
    return-void
.end method


# virtual methods
.method public getAsNumber()Ljava/lang/Number;
    .registers 2

    .prologue
    .line 102
    iget-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .prologue
    .line 106
    iget-object v0, p0, Lfreemarker/template/SimpleNumber;->value:Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
