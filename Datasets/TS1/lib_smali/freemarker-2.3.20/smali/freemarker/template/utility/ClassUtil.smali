.class public Lfreemarker/template/utility/ClassUtil;
.super Ljava/lang/Object;
.source "ClassUtil.java"


# static fields
.field static class$freemarker$core$Environment$Namespace:Ljava/lang/Class;

.field static class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateDirectiveModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateHashModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

.field static class$freemarker$template$TemplateMethodModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateMethodModelEx:Ljava/lang/Class;

.field static class$freemarker$template$TemplateModelIterator:Ljava/lang/Class;

.field static class$freemarker$template$TemplateNodeModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

.field static class$freemarker$template$TemplateTransformModel:Ljava/lang/Class;

.field static class$java$lang$Object:Ljava/lang/Class;


# direct methods
.method private constructor <init>()V
    .registers 1

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 96
    return-void
.end method

.method private static appendTemplateModelTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/Class;)V
    .registers 4
    .param p0, "sb"    # Ljava/lang/StringBuffer;
    .param p1, "typeNamesAppended"    # Ljava/util/Set;
    .param p2, "cl"    # Ljava/lang/Class;

    .prologue
    .line 229
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNodeModel:Ljava/lang/Class;

    if-nez v0, :cond_d0

    const-string v0, "freemarker.template.TemplateNodeModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNodeModel:Ljava/lang/Class;

    :goto_c
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_17

    .line 230
    const-string v0, "node"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 233
    :cond_17
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDirectiveModel:Ljava/lang/Class;

    if-nez v0, :cond_d4

    const-string v0, "freemarker.template.TemplateDirectiveModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDirectiveModel:Ljava/lang/Class;

    :goto_23
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_d8

    .line 234
    const-string v0, "directive"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 239
    :cond_2e
    :goto_2e
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    if-nez v0, :cond_f4

    const-string v0, "freemarker.template.TemplateSequenceModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    :goto_3a
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_f8

    .line 240
    const-string v0, "sequence"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 247
    :cond_45
    :goto_45
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModel:Ljava/lang/Class;

    if-nez v0, :cond_130

    const-string v0, "freemarker.template.TemplateMethodModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModel:Ljava/lang/Class;

    :goto_51
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5c

    .line 248
    const-string v0, "method"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 252
    :cond_5c
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$core$Environment$Namespace:Ljava/lang/Class;

    if-nez v0, :cond_134

    const-string v0, "freemarker.core.Environment$Namespace"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$core$Environment$Namespace:Ljava/lang/Class;

    :goto_68
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_138

    .line 253
    const-string v0, "namespace"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 260
    :cond_73
    :goto_73
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    if-nez v0, :cond_170

    const-string v0, "freemarker.template.TemplateNumberModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    :goto_7f
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_8a

    .line 261
    const-string v0, "number"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 264
    :cond_8a
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    if-nez v0, :cond_174

    const-string v0, "freemarker.template.TemplateDateModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    :goto_96
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_a1

    .line 265
    const-string v0, "date"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 268
    :cond_a1
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    if-nez v0, :cond_178

    const-string v0, "freemarker.template.TemplateBooleanModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    :goto_ad
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_b8

    .line 269
    const-string v0, "boolean"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 272
    :cond_b8
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    if-nez v0, :cond_17c

    const-string v0, "freemarker.template.TemplateScalarModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    :goto_c4
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_cf

    .line 273
    const-string v0, "string"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 275
    :cond_cf
    return-void

    .line 229
    :cond_d0
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNodeModel:Ljava/lang/Class;

    goto/16 :goto_c

    .line 233
    :cond_d4
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDirectiveModel:Ljava/lang/Class;

    goto/16 :goto_23

    .line 235
    :cond_d8
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateTransformModel:Ljava/lang/Class;

    if-nez v0, :cond_f1

    const-string v0, "freemarker.template.TemplateTransformModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateTransformModel:Ljava/lang/Class;

    :goto_e4
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_2e

    .line 236
    const-string v0, "transform"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    goto/16 :goto_2e

    .line 235
    :cond_f1
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateTransformModel:Ljava/lang/Class;

    goto :goto_e4

    .line 239
    :cond_f4
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    goto/16 :goto_3a

    .line 241
    :cond_f8
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    if-nez v0, :cond_111

    const-string v0, "freemarker.template.TemplateCollectionModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    :goto_104
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_114

    .line 242
    const-string v0, "collection"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    goto/16 :goto_45

    .line 241
    :cond_111
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    goto :goto_104

    .line 243
    :cond_114
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateModelIterator:Ljava/lang/Class;

    if-nez v0, :cond_12d

    const-string v0, "freemarker.template.TemplateModelIterator"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateModelIterator:Ljava/lang/Class;

    :goto_120
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_45

    .line 244
    const-string v0, "iterator"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    goto/16 :goto_45

    .line 243
    :cond_12d
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateModelIterator:Ljava/lang/Class;

    goto :goto_120

    .line 247
    :cond_130
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModel:Ljava/lang/Class;

    goto/16 :goto_51

    .line 252
    :cond_134
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$core$Environment$Namespace:Ljava/lang/Class;

    goto/16 :goto_68

    .line 254
    :cond_138
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    if-nez v0, :cond_151

    const-string v0, "freemarker.template.TemplateHashModelEx"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    :goto_144
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_154

    .line 255
    const-string v0, "extended_hash"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    goto/16 :goto_73

    .line 254
    :cond_151
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    goto :goto_144

    .line 256
    :cond_154
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModel:Ljava/lang/Class;

    if-nez v0, :cond_16d

    const-string v0, "freemarker.template.TemplateHashModel"

    invoke-static {v0}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModel:Ljava/lang/Class;

    :goto_160
    invoke-virtual {v0, p2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_73

    .line 257
    const-string v0, "hash"

    invoke-static {p0, p1, v0}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    goto/16 :goto_73

    .line 256
    :cond_16d
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModel:Ljava/lang/Class;

    goto :goto_160

    .line 260
    :cond_170
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    goto/16 :goto_7f

    .line 264
    :cond_174
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    goto/16 :goto_96

    .line 268
    :cond_178
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    goto/16 :goto_ad

    .line 272
    :cond_17c
    sget-object v0, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    goto/16 :goto_c4
.end method

.method private static appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V
    .registers 4
    .param p0, "sb"    # Ljava/lang/StringBuffer;
    .param p1, "typeNamesAppended"    # Ljava/util/Set;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 294
    invoke-interface {p1, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    .line 295
    invoke-virtual {p0}, Ljava/lang/StringBuffer;->length()I

    move-result v0

    if-eqz v0, :cond_11

    const-string v0, "+"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 296
    :cond_11
    invoke-virtual {p0, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 297
    invoke-interface {p1, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 299
    :cond_17
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 202
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_3} :catch_5

    move-result-object v1

    return-object v1

    :catch_5
    move-exception v0

    .local v0, "x1":Ljava/lang/ClassNotFoundException;
    new-instance v1, Ljava/lang/NoClassDefFoundError;

    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/NoClassDefFoundError;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static forName(Ljava/lang/String;)Ljava/lang/Class;
    .registers 3
    .param p0, "className"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 110
    const/4 v0, 0x1

    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-static {p0, v0, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_c} :catch_14
    .catch Ljava/lang/SecurityException; {:try_start_1 .. :try_end_c} :catch_e

    move-result-object v0

    .line 121
    :goto_d
    return-object v0

    .line 116
    :catch_e
    move-exception v0

    .line 121
    :goto_f
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_d

    .line 112
    :catch_14
    move-exception v0

    goto :goto_f
.end method

.method public static getFTLTypeDescription(Lfreemarker/template/TemplateModel;)Ljava/lang/String;
    .registers 9
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;

    .prologue
    const/4 v7, 0x1

    .line 310
    if-nez p0, :cond_6

    .line 311
    const-string v6, "Null"

    .line 348
    :goto_5
    return-object v6

    .line 313
    :cond_6
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 315
    .local v4, "typeNamesAppended":Ljava/util/Set;
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    .line 317
    .local v3, "sb":Ljava/lang/StringBuffer;
    invoke-static {p0}, Lfreemarker/template/utility/ClassUtil;->getPrimaryTemplateModelInterface(Lfreemarker/template/TemplateModel;)Ljava/lang/Class;

    move-result-object v2

    .line 318
    .local v2, "primaryInterface":Ljava/lang/Class;
    if-eqz v2, :cond_19

    .line 319
    invoke-static {v3, v4, v2}, Lfreemarker/template/utility/ClassUtil;->appendTemplateModelTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/Class;)V

    .line 322
    :cond_19
    instance-of v6, p0, Lfreemarker/core/Macro;

    if-eqz v6, :cond_2b

    move-object v6, p0

    .line 323
    check-cast v6, Lfreemarker/core/Macro;

    invoke-virtual {v6}, Lfreemarker/core/Macro;->isFunction()Z

    move-result v6

    if-eqz v6, :cond_5d

    const-string v6, "function"

    :goto_28
    invoke-static {v3, v4, v6}, Lfreemarker/template/utility/ClassUtil;->appendTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/String;)V

    .line 326
    :cond_2b
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v3, v4, v6}, Lfreemarker/template/utility/ClassUtil;->appendTemplateModelTypeName(Ljava/lang/StringBuffer;Ljava/util/Set;Ljava/lang/Class;)V

    .line 329
    invoke-static {p0}, Lfreemarker/template/utility/ClassUtil;->getUnwrappedClass(Lfreemarker/template/TemplateModel;)Ljava/lang/Class;

    move-result-object v5

    .line 330
    .local v5, "unwrappedClass":Ljava/lang/Class;
    if-eqz v5, :cond_60

    .line 331
    invoke-static {v5, v7}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v0

    .line 336
    .local v0, "javaClassName":Ljava/lang/String;
    :goto_3c
    const-string v6, " ("

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 337
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-static {v6, v7}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v1

    .line 338
    .local v1, "modelClassName":Ljava/lang/String;
    if-nez v0, :cond_62

    .line 339
    const-string v6, "wrapper: "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 340
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 346
    :goto_53
    const-string v6, ")"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 348
    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_5

    .line 323
    .end local v0    # "javaClassName":Ljava/lang/String;
    .end local v1    # "modelClassName":Ljava/lang/String;
    .end local v5    # "unwrappedClass":Ljava/lang/Class;
    :cond_5d
    const-string v6, "macro"

    goto :goto_28

    .line 333
    .restart local v5    # "unwrappedClass":Ljava/lang/Class;
    :cond_60
    const/4 v0, 0x0

    .restart local v0    # "javaClassName":Ljava/lang/String;
    goto :goto_3c

    .line 342
    .restart local v1    # "modelClassName":Ljava/lang/String;
    :cond_62
    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 343
    const-string v6, " wrapped into "

    invoke-virtual {v3, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 344
    invoke-virtual {v3, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_53
.end method

.method private static getPrimaryTemplateModelInterface(Lfreemarker/template/TemplateModel;)Ljava/lang/Class;
    .registers 4
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;

    .prologue
    const/4 v2, 0x0

    .line 200
    instance-of v1, p0, Lfreemarker/ext/beans/BeanModel;

    if-eqz v1, :cond_d7

    .line 201
    instance-of v1, p0, Lfreemarker/ext/beans/CollectionModel;

    if-eqz v1, :cond_19

    .line 202
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    if-nez v1, :cond_16

    const-string v1, "freemarker.template.TemplateSequenceModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    .line 224
    :goto_15
    return-object v1

    .line 202
    :cond_16
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateSequenceModel:Ljava/lang/Class;

    goto :goto_15

    .line 203
    :cond_19
    instance-of v1, p0, Lfreemarker/ext/beans/IteratorModel;

    if-nez v1, :cond_21

    instance-of v1, p0, Lfreemarker/ext/beans/EnumerationModel;

    if-eqz v1, :cond_31

    .line 204
    :cond_21
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    if-nez v1, :cond_2e

    const-string v1, "freemarker.template.TemplateCollectionModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    goto :goto_15

    :cond_2e
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateCollectionModel:Ljava/lang/Class;

    goto :goto_15

    .line 205
    :cond_31
    instance-of v1, p0, Lfreemarker/ext/beans/MapModel;

    if-eqz v1, :cond_45

    .line 206
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    if-nez v1, :cond_42

    const-string v1, "freemarker.template.TemplateHashModelEx"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    goto :goto_15

    :cond_42
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    goto :goto_15

    .line 207
    :cond_45
    instance-of v1, p0, Lfreemarker/ext/beans/NumberModel;

    if-eqz v1, :cond_59

    .line 208
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    if-nez v1, :cond_56

    const-string v1, "freemarker.template.TemplateNumberModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    goto :goto_15

    :cond_56
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateNumberModel:Ljava/lang/Class;

    goto :goto_15

    .line 209
    :cond_59
    instance-of v1, p0, Lfreemarker/ext/beans/BooleanModel;

    if-eqz v1, :cond_6d

    .line 210
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    if-nez v1, :cond_6a

    const-string v1, "freemarker.template.TemplateBooleanModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    goto :goto_15

    :cond_6a
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateBooleanModel:Ljava/lang/Class;

    goto :goto_15

    .line 211
    :cond_6d
    instance-of v1, p0, Lfreemarker/ext/beans/DateModel;

    if-eqz v1, :cond_81

    .line 212
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    if-nez v1, :cond_7e

    const-string v1, "freemarker.template.TemplateDateModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    goto :goto_15

    :cond_7e
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateDateModel:Ljava/lang/Class;

    goto :goto_15

    .line 213
    :cond_81
    instance-of v1, p0, Lfreemarker/ext/beans/SimpleMethodModel;

    if-nez v1, :cond_89

    instance-of v1, p0, Lfreemarker/ext/beans/OverloadedMethodsModel;

    if-eqz v1, :cond_9a

    .line 214
    :cond_89
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModelEx:Ljava/lang/Class;

    if-nez v1, :cond_96

    const-string v1, "freemarker.template.TemplateMethodModelEx"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModelEx:Ljava/lang/Class;

    goto :goto_15

    :cond_96
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateMethodModelEx:Ljava/lang/Class;

    goto/16 :goto_15

    .line 215
    :cond_9a
    instance-of v1, p0, Lfreemarker/ext/beans/StringModel;

    if-eqz v1, :cond_d4

    move-object v1, p0

    .line 216
    check-cast v1, Lfreemarker/ext/beans/BeanModel;

    invoke-virtual {v1}, Lfreemarker/ext/beans/BeanModel;->getWrappedObject()Ljava/lang/Object;

    move-result-object v0

    .line 217
    .local v0, "wrapped":Ljava/lang/Object;
    instance-of v1, v0, Ljava/lang/String;

    if-eqz v1, :cond_bb

    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    if-nez v1, :cond_b7

    const-string v1, "freemarker.template.TemplateScalarModel"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    goto/16 :goto_15

    :cond_b7
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateScalarModel:Ljava/lang/Class;

    goto/16 :goto_15

    :cond_bb
    instance-of v1, p0, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v1, :cond_d1

    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    if-nez v1, :cond_cd

    const-string v1, "freemarker.template.TemplateHashModelEx"

    invoke-static {v1}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    sput-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    goto/16 :goto_15

    :cond_cd
    sget-object v1, Lfreemarker/template/utility/ClassUtil;->class$freemarker$template$TemplateHashModelEx:Ljava/lang/Class;

    goto/16 :goto_15

    :cond_d1
    move-object v1, v2

    goto/16 :goto_15

    .end local v0    # "wrapped":Ljava/lang/Object;
    :cond_d4
    move-object v1, v2

    .line 221
    goto/16 :goto_15

    :cond_d7
    move-object v1, v2

    .line 224
    goto/16 :goto_15
.end method

.method public static getShortClassName(Ljava/lang/Class;)Ljava/lang/String;
    .registers 2
    .param p0, "pClass"    # Ljava/lang/Class;

    .prologue
    .line 130
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShortClassName(Ljava/lang/Class;Z)Ljava/lang/String;
    .registers 6
    .param p0, "pClass"    # Ljava/lang/Class;
    .param p1, "shortenFreeMarkerClasses"    # Z

    .prologue
    const/16 v3, 0xa

    .line 145
    if-nez p0, :cond_6

    .line 146
    const/4 v0, 0x0

    .line 168
    :cond_5
    :goto_5
    return-object v0

    .line 147
    :cond_6
    invoke-virtual {p0}, Ljava/lang/Class;->isArray()Z

    move-result v1

    if-eqz v1, :cond_28

    .line 148
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v2

    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const-string v2, "[]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 150
    :cond_28
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 151
    .local v0, "cn":Ljava/lang/String;
    const-string v1, "java.lang."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3c

    const-string v1, "java.util."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_41

    .line 152
    :cond_3c
    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 154
    :cond_41
    if-eqz p1, :cond_5

    .line 155
    const-string v1, "freemarker.template."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_65

    .line 156
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "f.t"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x13

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_5

    .line 157
    :cond_65
    const-string v1, "freemarker.ext.beans."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_88

    .line 158
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "f.e.b"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0x14

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    .line 159
    :cond_88
    const-string v1, "freemarker.core."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ab

    .line 160
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "f.c"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0xf

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    .line 161
    :cond_ab
    const-string v1, "freemarker.ext."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ce

    .line 162
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "f.e"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    const/16 v2, 0xe

    invoke-virtual {v0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5

    .line 163
    :cond_ce
    const-string v1, "freemarker."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 164
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "f"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v0, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_5
.end method

.method public static getShortClassNameOfObject(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2
    .param p0, "obj"    # Ljava/lang/Object;

    .prologue
    .line 179
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lfreemarker/template/utility/ClassUtil;->getShortClassNameOfObject(Ljava/lang/Object;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getShortClassNameOfObject(Ljava/lang/Object;Z)Ljava/lang/String;
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .param p1, "shortenFreeMarkerClasses"    # Z

    .prologue
    .line 189
    if-nez p0, :cond_5

    .line 190
    const-string v0, "Null"

    .line 192
    :goto_4
    return-object v0

    :cond_5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0, p1}, Lfreemarker/template/utility/ClassUtil;->getShortClassName(Ljava/lang/Class;Z)Ljava/lang/String;

    move-result-object v0

    goto :goto_4
.end method

.method private static getUnwrappedClass(Lfreemarker/template/TemplateModel;)Ljava/lang/Class;
    .registers 4
    .param p0, "tm"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 280
    :try_start_0
    instance-of v2, p0, Lfreemarker/ext/util/WrapperTemplateModel;

    if-eqz v2, :cond_11

    .line 281
    check-cast p0, Lfreemarker/ext/util/WrapperTemplateModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    invoke-interface {p0}, Lfreemarker/ext/util/WrapperTemplateModel;->getWrappedObject()Ljava/lang/Object;
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_9} :catch_2d

    move-result-object v1

    .line 290
    :goto_a
    if-eqz v1, :cond_30

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    :goto_10
    return-object v2

    .line 282
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_11
    :try_start_11
    instance-of v2, p0, Lfreemarker/template/AdapterTemplateModel;

    if-eqz v2, :cond_2b

    .line 283
    check-cast p0, Lfreemarker/template/AdapterTemplateModel;

    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    sget-object v2, Lfreemarker/template/utility/ClassUtil;->class$java$lang$Object:Ljava/lang/Class;

    if-nez v2, :cond_28

    const-string v2, "java.lang.Object"

    invoke-static {v2}, Lfreemarker/template/utility/ClassUtil;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    sput-object v2, Lfreemarker/template/utility/ClassUtil;->class$java$lang$Object:Ljava/lang/Class;

    :goto_23
    invoke-interface {p0, v2}, Lfreemarker/template/AdapterTemplateModel;->getAdaptedObject(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    .local v1, "unwrapped":Ljava/lang/Object;
    goto :goto_a

    .end local v1    # "unwrapped":Ljava/lang/Object;
    :cond_28
    sget-object v2, Lfreemarker/template/utility/ClassUtil;->class$java$lang$Object:Ljava/lang/Class;
    :try_end_2a
    .catch Ljava/lang/Throwable; {:try_start_11 .. :try_end_2a} :catch_2d

    goto :goto_23

    .line 285
    .restart local p0    # "tm":Lfreemarker/template/TemplateModel;
    :cond_2b
    const/4 v1, 0x0

    .restart local v1    # "unwrapped":Ljava/lang/Object;
    goto :goto_a

    .line 287
    .end local v1    # "unwrapped":Ljava/lang/Object;
    .end local p0    # "tm":Lfreemarker/template/TemplateModel;
    :catch_2d
    move-exception v0

    .line 288
    .local v0, "e":Ljava/lang/Throwable;
    const/4 v1, 0x0

    .restart local v1    # "unwrapped":Ljava/lang/Object;
    goto :goto_a

    .line 290
    .end local v0    # "e":Ljava/lang/Throwable;
    .end local v1    # "unwrapped":Ljava/lang/Object;
    :cond_30
    const/4 v2, 0x0

    goto :goto_10
.end method
