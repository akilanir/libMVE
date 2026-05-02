.class public Lfreemarker/core/StringArraySequence;
.super Ljava/lang/Object;
.source "StringArraySequence.java"

# interfaces
.implements Lfreemarker/template/TemplateSequenceModel;


# instance fields
.field private array:[Lfreemarker/template/TemplateScalarModel;

.field private stringArray:[Ljava/lang/String;


# direct methods
.method public constructor <init>([Ljava/lang/String;)V
    .registers 2
    .param p1, "stringArray"    # [Ljava/lang/String;

    .prologue
    .line 74
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 75
    iput-object p1, p0, Lfreemarker/core/StringArraySequence;->stringArray:[Ljava/lang/String;

    .line 76
    return-void
.end method


# virtual methods
.method public get(I)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "index"    # I

    .prologue
    .line 79
    iget-object v1, p0, Lfreemarker/core/StringArraySequence;->array:[Lfreemarker/template/TemplateScalarModel;

    if-nez v1, :cond_b

    .line 80
    iget-object v1, p0, Lfreemarker/core/StringArraySequence;->stringArray:[Ljava/lang/String;

    array-length v1, v1

    new-array v1, v1, [Lfreemarker/template/TemplateScalarModel;

    iput-object v1, p0, Lfreemarker/core/StringArraySequence;->array:[Lfreemarker/template/TemplateScalarModel;

    .line 82
    :cond_b
    iget-object v1, p0, Lfreemarker/core/StringArraySequence;->array:[Lfreemarker/template/TemplateScalarModel;

    aget-object v0, v1, p1

    .line 83
    .local v0, "result":Lfreemarker/template/TemplateScalarModel;
    if-nez v0, :cond_1e

    .line 84
    new-instance v0, Lfreemarker/template/SimpleScalar;

    .end local v0    # "result":Lfreemarker/template/TemplateScalarModel;
    iget-object v1, p0, Lfreemarker/core/StringArraySequence;->stringArray:[Ljava/lang/String;

    aget-object v1, v1, p1

    invoke-direct {v0, v1}, Lfreemarker/template/SimpleScalar;-><init>(Ljava/lang/String;)V

    .line 85
    .restart local v0    # "result":Lfreemarker/template/TemplateScalarModel;
    iget-object v1, p0, Lfreemarker/core/StringArraySequence;->array:[Lfreemarker/template/TemplateScalarModel;

    aput-object v0, v1, p1

    .line 87
    :cond_1e
    return-object v0
.end method

.method public size()I
    .registers 2

    .prologue
    .line 91
    iget-object v0, p0, Lfreemarker/core/StringArraySequence;->stringArray:[Ljava/lang/String;

    array-length v0, v0

    return v0
.end method
