.class public Lfreemarker/template/utility/StandardCompress;
.super Ljava/lang/Object;
.source "StandardCompress.java"

# interfaces
.implements Lfreemarker/template/TemplateTransformModel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;
    }
.end annotation


# static fields
.field private static final BUFFER_SIZE_KEY:Ljava/lang/String; = "buffer_size"

.field public static final INSTANCE:Lfreemarker/template/utility/StandardCompress;

.field private static final SINGLE_LINE_KEY:Ljava/lang/String; = "single_line"


# instance fields
.field private defaultBufferSize:I


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .prologue
    .line 110
    new-instance v0, Lfreemarker/template/utility/StandardCompress;

    invoke-direct {v0}, Lfreemarker/template/utility/StandardCompress;-><init>()V

    sput-object v0, Lfreemarker/template/utility/StandardCompress;->INSTANCE:Lfreemarker/template/utility/StandardCompress;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .prologue
    .line 114
    const/16 v0, 0x800

    invoke-direct {p0, v0}, Lfreemarker/template/utility/StandardCompress;-><init>(I)V

    .line 115
    return-void
.end method

.method public constructor <init>(I)V
    .registers 2
    .param p1, "defaultBufferSize"    # I

    .prologue
    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    iput p1, p0, Lfreemarker/template/utility/StandardCompress;->defaultBufferSize:I

    .line 123
    return-void
.end method


# virtual methods
.method public getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;
    .registers 10
    .param p1, "out"    # Ljava/io/Writer;
    .param p2, "args"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 128
    iget v0, p0, Lfreemarker/template/utility/StandardCompress;->defaultBufferSize:I

    .line 129
    .local v0, "bufferSize":I
    const/4 v4, 0x0

    .line 130
    .local v4, "singleLine":Z
    if-eqz p2, :cond_25

    .line 132
    :try_start_5
    const-string v5, "buffer_size"

    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfreemarker/template/TemplateNumberModel;

    .line 133
    .local v3, "num":Lfreemarker/template/TemplateNumberModel;
    if-eqz v3, :cond_17

    .line 134
    invoke-interface {v3}, Lfreemarker/template/TemplateNumberModel;->getAsNumber()Ljava/lang/Number;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Number;->intValue()I
    :try_end_16
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_16} :catch_2b

    move-result v0

    .line 139
    :cond_17
    :try_start_17
    const-string v5, "single_line"

    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lfreemarker/template/TemplateBooleanModel;

    .line 140
    .local v2, "flag":Lfreemarker/template/TemplateBooleanModel;
    if-eqz v2, :cond_25

    .line 141
    invoke-interface {v2}, Lfreemarker/template/TemplateBooleanModel;->getAsBoolean()Z
    :try_end_24
    .catch Ljava/lang/ClassCastException; {:try_start_17 .. :try_end_24} :catch_34

    move-result v4

    .line 146
    .end local v2    # "flag":Lfreemarker/template/TemplateBooleanModel;
    .end local v3    # "num":Lfreemarker/template/TemplateNumberModel;
    :cond_25
    new-instance v5, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;

    invoke-direct {v5, p1, v0, v4}, Lfreemarker/template/utility/StandardCompress$StandardCompressWriter;-><init>(Ljava/io/Writer;IZ)V

    return-object v5

    .line 135
    :catch_2b
    move-exception v1

    .line 136
    .local v1, "e":Ljava/lang/ClassCastException;
    new-instance v5, Lfreemarker/template/TemplateModelException;

    const-string v6, "Expecting numerical argument to buffer_size"

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 142
    .end local v1    # "e":Ljava/lang/ClassCastException;
    .restart local v3    # "num":Lfreemarker/template/TemplateNumberModel;
    :catch_34
    move-exception v1

    .line 143
    .restart local v1    # "e":Ljava/lang/ClassCastException;
    new-instance v5, Lfreemarker/template/TemplateModelException;

    const-string v6, "Expecting boolean argument to single_line"

    invoke-direct {v5, v6}, Lfreemarker/template/TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v5
.end method
