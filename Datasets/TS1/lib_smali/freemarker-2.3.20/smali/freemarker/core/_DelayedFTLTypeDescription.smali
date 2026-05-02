.class public Lfreemarker/core/_DelayedFTLTypeDescription;
.super Lfreemarker/core/_DelayedConversionToString;
.source "_DelayedFTLTypeDescription.java"


# direct methods
.method public constructor <init>(Lfreemarker/template/TemplateModel;)V
    .registers 2
    .param p1, "tm"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lfreemarker/core/_DelayedConversionToString;-><init>(Ljava/lang/Object;)V

    .line 11
    return-void
.end method


# virtual methods
.method protected doConversion(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 14
    check-cast p1, Lfreemarker/template/TemplateModel;

    .end local p1    # "obj":Ljava/lang/Object;
    invoke-static {p1}, Lfreemarker/template/utility/ClassUtil;->getFTLTypeDescription(Lfreemarker/template/TemplateModel;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
