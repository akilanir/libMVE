.class final Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;
.super Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;
.source "ViewDescriptor.java"

# interfaces
.implements Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;,
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;,
        Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor",
        "<",
        "Landroid/view/View;",
        ">;",
        "Lcom/facebook/stetho/inspector/elements/android/HighlightableDescriptor;"
    }
.end annotation


# static fields
.field private static final ID_NAME:Ljava/lang/String; = "id"

.field private static final NONE_MAPPING:Ljava/lang/String; = "<no mapping>"

.field private static final NONE_VALUE:Ljava/lang/String; = "(none)"


# instance fields
.field private final mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

.field private volatile mViewProperties:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .annotation build Ljavax/annotation/concurrent/GuardedBy;
        value = "this"
    .end annotation
.end field

.field private mWordBoundaryPattern:Ljava/util/regex/Pattern;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 111
    new-instance v0, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    invoke-direct {v0}, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;-><init>()V

    invoke-direct {p0, v0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;-><init>(Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;)V

    .line 112
    return-void
.end method

.method public constructor <init>(Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;)V
    .registers 2
    .param p1, "methodInvoker"    # Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    .prologue
    .line 114
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/AbstractChainedDescriptor;-><init>()V

    .line 115
    iput-object p1, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    .line 116
    return-void
.end method

.method private static canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z
    .registers 2
    .param p0, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 203
    if-eqz p0, :cond_11

    .line 204
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 205
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private static canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z
    .registers 2
    .param p0, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 180
    if-eqz p0, :cond_11

    .line 181
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v0

    if-eqz v0, :cond_11

    .line 182
    invoke-interface {p0}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v0

    array-length v0, v0

    if-lez v0, :cond_11

    const/4 v0, 0x1

    :goto_10
    return v0

    :cond_11
    const/4 v0, 0x0

    goto :goto_10
.end method

.method private static capitalize(Ljava/lang/String;)Ljava/lang/String;
    .registers 4
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 408
    if-eqz p0, :cond_13

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_13

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isTitleCase(C)Z

    move-result v1

    if-eqz v1, :cond_14

    .line 413
    .end local p0    # "str":Ljava/lang/String;
    :cond_13
    :goto_13
    return-object p0

    .line 411
    .restart local p0    # "str":Ljava/lang/String;
    :cond_14
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 412
    .local v0, "buffer":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toTitleCase(C)C

    move-result v1

    invoke-virtual {v0, v2, v1}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 413
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_13
.end method

.method private convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;
    .registers 7
    .param p1, "getterName"    # Ljava/lang/String;

    .prologue
    .line 263
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getWordBoundaryPattern()Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v2

    .line 265
    .local v2, "words":[Ljava/lang/String;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_e
    array-length v3, v2

    if-ge v0, v3, :cond_3c

    .line 268
    aget-object v3, v2, v0

    const-string v4, "get"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_25

    aget-object v3, v2, v0

    const-string v4, "m"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    .line 267
    :cond_25
    :goto_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_e

    .line 272
    :cond_28
    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 274
    array-length v3, v2

    add-int/lit8 v3, v3, -0x1

    if-ge v0, v3, :cond_25

    .line 275
    const/16 v3, 0x2d

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_25

    .line 279
    :cond_3c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private static getIdAttribute(Landroid/view/View;)Ljava/lang/String;
    .registers 3
    .param p0, "element"    # Landroid/view/View;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0}, Landroid/view/View;->getId()I

    move-result v0

    .line 148
    .local v0, "id":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_9

    .line 149
    const/4 v1, 0x0

    .line 151
    :goto_8
    return-object v1

    :cond_9
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p0, v1, v0}, Lcom/facebook/stetho/common/android/ResourcesUtil;->getIdStringQuietly(Ljava/lang/Object;Landroid/content/res/Resources;I)Ljava/lang/String;

    move-result-object v1

    goto :goto_8
.end method

.method private getIdStyle(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 7
    .param p1, "element"    # Landroid/view/View;
    .param p2, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    const/4 v3, 0x0

    .line 304
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdAttribute(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    .line 306
    .local v0, "id":Ljava/lang/String;
    if-nez v0, :cond_f

    .line 307
    const-string v1, "id"

    const-string v2, "(none)"

    invoke-interface {p2, v1, v2, v3}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 311
    :goto_e
    return-void

    .line 309
    :cond_f
    const-string v1, "id"

    invoke-interface {p2, v1, v0, v3}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_e
.end method

.method private getStyleFromFloat(Ljava/lang/String;Ljava/lang/Float;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Float;
    .param p3, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    .line 341
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->isDefaultValue(Ljava/lang/Float;)Z

    move-result v1

    invoke-interface {p4, p1, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 342
    return-void
.end method

.method private getStyleFromInteger(Ljava/lang/String;Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 9
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Integer;
    .param p3, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    const/4 v3, 0x0

    .line 319
    invoke-static {}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->getInstance()Lcom/facebook/stetho/inspector/helper/IntegerFormatter;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Lcom/facebook/stetho/inspector/helper/IntegerFormatter;->format(Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v0

    .line 321
    .local v0, "intValueStr":Ljava/lang/String;
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-eqz v1, :cond_38

    .line 322
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 324
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mapIntToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 322
    invoke-interface {p4, p1, v1, v3}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 334
    :goto_37
    return-void

    .line 326
    :cond_38
    invoke-static {p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-eqz v1, :cond_67

    .line 327
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " ("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 329
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-static {v2, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mapFlagsToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 327
    invoke-interface {p4, p1, v1, v3}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_37

    .line 332
    :cond_67
    invoke-static {p2, p3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->isDefaultValue(Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    invoke-interface {p4, p1, v0, v1}, Lcom/facebook/stetho/inspector/elements/StyleAccumulator;->store(Ljava/lang/String;Ljava/lang/String;Z)V

    goto :goto_37
.end method

.method private getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 7
    .param p1, "element"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    .line 289
    const-string v0, "id"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    .line 290
    invoke-direct {p0, p1, p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdStyle(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    .line 298
    .end local p3    # "value":Ljava/lang/Object;
    :goto_b
    return-void

    .line 291
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_c
    instance-of v0, p3, Ljava/lang/Integer;

    if-eqz v0, :cond_16

    .line 292
    check-cast p3, Ljava/lang/Integer;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromInteger(Ljava/lang/String;Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto :goto_b

    .line 293
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_16
    instance-of v0, p3, Ljava/lang/Float;

    if-eqz v0, :cond_20

    .line 294
    check-cast p3, Ljava/lang/Float;

    .end local p3    # "value":Ljava/lang/Object;
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromFloat(Ljava/lang/String;Ljava/lang/Float;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto :goto_b

    .line 296
    .restart local p3    # "value":Ljava/lang/Object;
    :cond_20
    invoke-direct/range {p0 .. p5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStylesFromObject(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto :goto_b
.end method

.method private getStylesFromObject(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 20
    .param p1, "view"    # Landroid/view/View;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/Object;
    .param p4, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p5, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    .line 350
    if-eqz p4, :cond_a

    invoke-interface/range {p4 .. p4}, Landroid/view/ViewDebug$ExportedProperty;->deepExport()Z

    move-result v1

    if-eqz v1, :cond_a

    if-nez p3, :cond_b

    .line 405
    :cond_a
    :goto_a
    return-void

    .line 354
    :cond_b
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getFields()[Ljava/lang/reflect/Field;

    move-result-object v10

    .line 356
    .local v10, "fields":[Ljava/lang/reflect/Field;
    array-length v13, v10

    const/4 v1, 0x0

    move v12, v1

    :goto_16
    if-ge v12, v13, :cond_a

    aget-object v9, v10, v12

    .line 357
    .local v9, "field":Ljava/lang/reflect/Field;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v11

    .line 358
    .local v11, "modifiers":I
    invoke-static {v11}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v1

    if-eqz v1, :cond_28

    .line 356
    :goto_24
    add-int/lit8 v1, v12, 0x1

    move v12, v1

    goto :goto_16

    .line 364
    :cond_28
    const/4 v1, 0x1

    :try_start_29
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 365
    move-object/from16 v0, p3

    invoke-virtual {v9, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_31
    .catch Ljava/lang/IllegalAccessException; {:try_start_29 .. :try_end_31} :catch_5b

    move-result-object v4

    .line 373
    .local v4, "propertyValue":Ljava/lang/Object;
    invoke-virtual {v9}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    .line 375
    .local v3, "propertyName":Ljava/lang/String;
    const/4 v1, -0x1

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_ca

    :cond_3e
    :goto_3e
    packed-switch v1, :pswitch_data_dc

    .line 389
    invoke-interface/range {p4 .. p4}, Landroid/view/ViewDebug$ExportedProperty;->prefix()Ljava/lang/String;

    move-result-object v7

    .line 390
    .local v7, "annotationPrefix":Ljava/lang/String;
    if-nez v7, :cond_b7

    .end local v3    # "propertyName":Ljava/lang/String;
    :goto_47
    invoke-direct {p0, v3}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 395
    .end local v7    # "annotationPrefix":Ljava/lang/String;
    .restart local v3    # "propertyName":Ljava/lang/String;
    :goto_4b
    const-class v1, Landroid/view/ViewDebug$ExportedProperty;

    .line 396
    invoke-virtual {v9, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Landroid/view/ViewDebug$ExportedProperty;

    .local v5, "subAnnotation":Landroid/view/ViewDebug$ExportedProperty;
    move-object v1, p0

    move-object v2, p1

    move-object/from16 v6, p5

    .line 398
    invoke-direct/range {v1 .. v6}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    goto :goto_24

    .line 366
    .end local v3    # "propertyName":Ljava/lang/String;
    .end local v4    # "propertyValue":Ljava/lang/Object;
    .end local v5    # "subAnnotation":Landroid/view/ViewDebug$ExportedProperty;
    :catch_5b
    move-exception v8

    .line 367
    .local v8, "e":Ljava/lang/IllegalAccessException;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "failed to get property of name: \""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    move-object/from16 v0, p2

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\" of object: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 369
    invoke-static/range {p3 .. p3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 367
    invoke-static {v8, v1}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_a

    .line 375
    .end local v8    # "e":Ljava/lang/IllegalAccessException;
    .restart local v3    # "propertyName":Ljava/lang/String;
    .restart local v4    # "propertyValue":Ljava/lang/Object;
    :sswitch_83
    const-string v2, "bottomMargin"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    const/4 v1, 0x0

    goto :goto_3e

    :sswitch_8d
    const-string v2, "topMargin"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    const/4 v1, 0x1

    goto :goto_3e

    :sswitch_97
    const-string v2, "leftMargin"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    const/4 v1, 0x2

    goto :goto_3e

    :sswitch_a1
    const-string v2, "rightMargin"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3e

    const/4 v1, 0x3

    goto :goto_3e

    .line 377
    :pswitch_ab
    const-string v3, "margin-bottom"

    .line 378
    goto :goto_4b

    .line 380
    :pswitch_ae
    const-string v3, "margin-top"

    .line 381
    goto :goto_4b

    .line 383
    :pswitch_b1
    const-string v3, "margin-left"

    .line 384
    goto :goto_4b

    .line 386
    :pswitch_b4
    const-string v3, "margin-right"

    .line 387
    goto :goto_4b

    .line 390
    .restart local v7    # "annotationPrefix":Ljava/lang/String;
    :cond_b7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_47

    .line 375
    :sswitch_data_ca
    .sparse-switch
        -0x23c1d116 -> :sswitch_a1
        -0x18afe09d -> :sswitch_8d
        0x72f7b095 -> :sswitch_97
        0x7b0f7fb9 -> :sswitch_83
    .end sparse-switch

    :pswitch_data_dc
    .packed-switch 0x0
        :pswitch_ab
        :pswitch_ae
        :pswitch_b1
        :pswitch_b4
    .end packed-switch
.end method

.method private getViewProperties()Ljava/util/List;
    .registers 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 65
    iget-object v5, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    if-nez v5, :cond_6f

    .line 66
    monitor-enter p0

    .line 67
    :try_start_6
    iget-object v5, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    if-nez v5, :cond_6e

    .line 68
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .local v3, "props":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    const-class v5, Landroid/view/View;

    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredMethods()[Ljava/lang/reflect/Method;

    move-result-object v6

    array-length v7, v6

    move v5, v4

    :goto_17
    if-ge v5, v7, :cond_38

    aget-object v2, v6, v5

    .line 71
    .local v2, "method":Ljava/lang/reflect/Method;
    const-class v8, Landroid/view/ViewDebug$ExportedProperty;

    .line 72
    invoke-virtual {v2, v8}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Landroid/view/ViewDebug$ExportedProperty;

    .line 75
    .local v0, "annotation":Landroid/view/ViewDebug$ExportedProperty;
    if-eqz v0, :cond_35

    .line 76
    new-instance v8, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;

    .line 78
    invoke-virtual {v2}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-direct {p0, v9}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, p0, v2, v9, v0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$MethodBackedCSSProperty;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;Ljava/lang/reflect/Method;Ljava/lang/String;Landroid/view/ViewDebug$ExportedProperty;)V

    .line 76
    invoke-interface {v3, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    :cond_35
    add-int/lit8 v5, v5, 0x1

    goto :goto_17

    .line 83
    .end local v0    # "annotation":Landroid/view/ViewDebug$ExportedProperty;
    .end local v2    # "method":Ljava/lang/reflect/Method;
    :cond_38
    const-class v5, Landroid/view/View;

    invoke-virtual {v5}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v5

    array-length v6, v5

    :goto_3f
    if-ge v4, v6, :cond_60

    aget-object v1, v5, v4

    .line 84
    .local v1, "field":Ljava/lang/reflect/Field;
    const-class v7, Landroid/view/ViewDebug$ExportedProperty;

    .line 85
    invoke-virtual {v1, v7}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Landroid/view/ViewDebug$ExportedProperty;

    .line 88
    .restart local v0    # "annotation":Landroid/view/ViewDebug$ExportedProperty;
    if-eqz v0, :cond_5d

    .line 89
    new-instance v7, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;

    .line 91
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-direct {p0, v8}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->convertViewPropertyNameToCSSName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, p0, v1, v8, v0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$FieldBackedCSSProperty;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;Ljava/lang/reflect/Field;Ljava/lang/String;Landroid/view/ViewDebug$ExportedProperty;)V

    .line 89
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 83
    :cond_5d
    add-int/lit8 v4, v4, 0x1

    goto :goto_3f

    .line 96
    .end local v0    # "annotation":Landroid/view/ViewDebug$ExportedProperty;
    .end local v1    # "field":Ljava/lang/reflect/Field;
    :cond_60
    new-instance v4, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$1;

    invoke-direct {v4, p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$1;-><init>(Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;)V

    invoke-static {v3, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 102
    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    iput-object v4, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    .line 104
    .end local v3    # "props":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    :cond_6e
    monitor-exit p0
    :try_end_6f
    .catchall {:try_start_6 .. :try_end_6f} :catchall_72

    .line 107
    :cond_6f
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mViewProperties:Ljava/util/List;

    return-object v4

    .line 104
    :catchall_72
    move-exception v4

    :try_start_73
    monitor-exit p0
    :try_end_74
    .catchall {:try_start_73 .. :try_end_74} :catchall_72

    throw v4
.end method

.method private getWordBoundaryPattern()Ljava/util/regex/Pattern;
    .registers 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    if-nez v0, :cond_c

    .line 58
    const-string v0, "(?<=\\p{Lower})(?=\\p{Upper})"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    .line 61
    :cond_c
    iget-object v0, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mWordBoundaryPattern:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method private static isDefaultValue(Ljava/lang/Float;)Z
    .registers 3
    .param p0, "value"    # Ljava/lang/Float;

    .prologue
    .line 242
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_b

    const/4 v0, 0x1

    :goto_a
    return v0

    :cond_b
    const/4 v0, 0x0

    goto :goto_a
.end method

.method private static isDefaultValue(Ljava/lang/Integer;Landroid/view/ViewDebug$ExportedProperty;)Z
    .registers 4
    .param p0, "value"    # Ljava/lang/Integer;
    .param p1, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 251
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-nez v1, :cond_d

    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 255
    :cond_d
    :goto_d
    return v0

    :cond_e
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-nez v1, :cond_d

    const/4 v0, 0x1

    goto :goto_d
.end method

.method private static mapFlagsToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;
    .registers 12
    .param p0, "value"    # I
    .param p1, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 211
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canFlagsBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v3

    if-nez v3, :cond_f

    .line 212
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Cannot map using this annotation"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 215
    :cond_f
    const/4 v2, 0x0

    .line 216
    .local v2, "stringBuilder":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 218
    .local v0, "atLeastOneFlag":Z
    invoke-interface {p1}, Landroid/view/ViewDebug$ExportedProperty;->flagMapping()[Landroid/view/ViewDebug$FlagToString;

    move-result-object v6

    array-length v7, v6

    move v5, v4

    :goto_17
    if-ge v5, v7, :cond_49

    aget-object v1, v6, v5

    .line 219
    .local v1, "flagToString":Landroid/view/ViewDebug$FlagToString;
    invoke-interface {v1}, Landroid/view/ViewDebug$FlagToString;->outputIf()Z

    move-result v8

    invoke-interface {v1}, Landroid/view/ViewDebug$FlagToString;->mask()I

    move-result v3

    and-int/2addr v3, p0

    invoke-interface {v1}, Landroid/view/ViewDebug$FlagToString;->equals()I

    move-result v9

    if-ne v3, v9, :cond_47

    const/4 v3, 0x1

    :goto_2b
    if-ne v8, v3, :cond_43

    .line 220
    if-nez v2, :cond_34

    .line 221
    new-instance v2, Ljava/lang/StringBuilder;

    .end local v2    # "stringBuilder":Ljava/lang/StringBuilder;
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .restart local v2    # "stringBuilder":Ljava/lang/StringBuilder;
    :cond_34
    if-eqz v0, :cond_3b

    .line 225
    const-string v3, " | "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 228
    :cond_3b
    invoke-interface {v1}, Landroid/view/ViewDebug$FlagToString;->name()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    const/4 v0, 0x1

    .line 218
    :cond_43
    add-int/lit8 v3, v5, 0x1

    move v5, v3

    goto :goto_17

    :cond_47
    move v3, v4

    .line 219
    goto :goto_2b

    .line 233
    .end local v1    # "flagToString":Landroid/view/ViewDebug$FlagToString;
    :cond_49
    if-eqz v0, :cond_50

    .line 234
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 236
    :goto_4f
    return-object v3

    :cond_50
    const-string v3, "<no mapping>"

    goto :goto_4f
.end method

.method private static mapIntToStringUsingAnnotation(ILandroid/view/ViewDebug$ExportedProperty;)Ljava/lang/String;
    .registers 7
    .param p0, "value"    # I
    .param p1, "annotation"    # Landroid/view/ViewDebug$ExportedProperty;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 188
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->canIntBeMappedToString(Landroid/view/ViewDebug$ExportedProperty;)Z

    move-result v1

    if-nez v1, :cond_e

    .line 189
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Cannot map using this annotation"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 192
    :cond_e
    invoke-interface {p1}, Landroid/view/ViewDebug$ExportedProperty;->mapping()[Landroid/view/ViewDebug$IntToString;

    move-result-object v2

    array-length v3, v2

    const/4 v1, 0x0

    :goto_14
    if-ge v1, v3, :cond_26

    aget-object v0, v2, v1

    .line 193
    .local v0, "map":Landroid/view/ViewDebug$IntToString;
    invoke-interface {v0}, Landroid/view/ViewDebug$IntToString;->from()I

    move-result v4

    if-ne v4, p0, :cond_23

    .line 194
    invoke-interface {v0}, Landroid/view/ViewDebug$IntToString;->to()Ljava/lang/String;

    move-result-object v1

    .line 199
    .end local v0    # "map":Landroid/view/ViewDebug$IntToString;
    :goto_22
    return-object v1

    .line 192
    .restart local v0    # "map":Landroid/view/ViewDebug$IntToString;
    :cond_23
    add-int/lit8 v1, v1, 0x1

    goto :goto_14

    .line 199
    .end local v0    # "map":Landroid/view/ViewDebug$IntToString;
    :cond_26
    const-string v1, "<no mapping>"

    goto :goto_22
.end method


# virtual methods
.method public getViewForHighlighting(Ljava/lang/Object;)Landroid/view/View;
    .registers 2
    .param p1, "element"    # Ljava/lang/Object;

    .prologue
    .line 156
    check-cast p1, Landroid/view/View;

    .end local p1    # "element":Ljava/lang/Object;
    return-object p1
.end method

.method protected onGetAttributes(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .registers 5
    .param p1, "element"    # Landroid/view/View;
    .param p2, "attributes"    # Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;

    .prologue
    .line 129
    invoke-static {p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getIdAttribute(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    .line 130
    .local v0, "id":Ljava/lang/String;
    if-eqz v0, :cond_b

    .line 131
    const-string v1, "id"

    invoke-interface {p2, v1, v0}, Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;->store(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :cond_b
    return-void
.end method

.method protected bridge synthetic onGetAttributes(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V
    .registers 3

    .prologue
    .line 36
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetAttributes(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/AttributeAccumulator;)V

    return-void
.end method

.method protected onGetNodeName(Landroid/view/View;)Ljava/lang/String;
    .registers 5
    .param p1, "element"    # Landroid/view/View;

    .prologue
    .line 120
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "className":Ljava/lang/String;
    const-string v1, "android.view."

    const-string v2, "android.widget."

    .line 124
    invoke-static {v0, v2}, Lcom/facebook/stetho/common/StringUtil;->removePrefix(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 123
    invoke-static {v0, v1, v2}, Lcom/facebook/stetho/common/StringUtil;->removePrefix(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected bridge synthetic onGetNodeName(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .prologue
    .line 36
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetNodeName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected onGetStyles(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 14
    .param p1, "element"    # Landroid/view/View;
    .param p2, "styles"    # Lcom/facebook/stetho/inspector/elements/StyleAccumulator;

    .prologue
    .line 162
    invoke-direct {p0}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getViewProperties()Ljava/util/List;

    move-result-object v8

    .line 163
    .local v8, "properties":Ljava/util/List;, "Ljava/util/List<Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;>;"
    const/4 v7, 0x0

    .local v7, "i":I
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    .local v10, "size":I
    :goto_9
    if-ge v7, v10, :cond_50

    .line 164
    invoke-interface {v8, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;

    .line 168
    .local v9, "property":Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;
    :try_start_11
    invoke-virtual {v9}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getCSSName()Ljava/lang/String;

    move-result-object v2

    .line 169
    invoke-virtual {v9, p1}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getValue(Landroid/view/View;)Ljava/lang/Object;

    move-result-object v3

    .line 170
    invoke-virtual {v9}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getAnnotation()Landroid/view/ViewDebug$ExportedProperty;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    .line 166
    invoke-direct/range {v0 .. v5}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->getStyleFromValue(Landroid/view/View;Ljava/lang/String;Ljava/lang/Object;Landroid/view/ViewDebug$ExportedProperty;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    :try_end_23
    .catch Ljava/lang/IllegalAccessException; {:try_start_11 .. :try_end_23} :catch_26
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_11 .. :try_end_23} :catch_26

    .line 163
    :goto_23
    add-int/lit8 v7, v7, 0x1

    goto :goto_9

    .line 172
    :catch_26
    move-exception v6

    .line 173
    .local v6, "e":Ljava/lang/ReflectiveOperationException;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "failed to get style property "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v9}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;->getCSSName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " of element= "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 174
    invoke-virtual {p1}, Landroid/view/View;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 173
    invoke-static {v6, v0}, Lcom/facebook/stetho/common/LogUtil;->e(Ljava/lang/Throwable;Ljava/lang/String;)V

    goto :goto_23

    .line 177
    .end local v6    # "e":Ljava/lang/ReflectiveOperationException;
    .end local v9    # "property":Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor$ViewCSSProperty;
    :cond_50
    return-void
.end method

.method protected bridge synthetic onGetStyles(Ljava/lang/Object;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V
    .registers 3

    .prologue
    .line 36
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onGetStyles(Landroid/view/View;Lcom/facebook/stetho/inspector/elements/StyleAccumulator;)V

    return-void
.end method

.method protected onSetAttributesAsText(Landroid/view/View;Ljava/lang/String;)V
    .registers 10
    .param p1, "element"    # Landroid/view/View;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-static {p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->parseSetAttributesAsTextArg(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v0

    .line 138
    .local v0, "attributeToValueMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_c
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_41

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 139
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "set"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->capitalize(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 140
    .local v2, "methodName":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 141
    .local v3, "propertyValue":Ljava/lang/String;
    iget-object v4, p0, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->mMethodInvoker:Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;

    invoke-virtual {v4, p1, v2, v3}, Lcom/facebook/stetho/inspector/elements/android/MethodInvoker;->invoke(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_c

    .line 143
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "methodName":Ljava/lang/String;
    .end local v3    # "propertyValue":Ljava/lang/String;
    :cond_41
    return-void
.end method

.method protected bridge synthetic onSetAttributesAsText(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    .prologue
    .line 36
    check-cast p1, Landroid/view/View;

    invoke-virtual {p0, p1, p2}, Lcom/facebook/stetho/inspector/elements/android/ViewDescriptor;->onSetAttributesAsText(Landroid/view/View;Ljava/lang/String;)V

    return-void
.end method
