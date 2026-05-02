.class public final Lfreemarker/core/Environment;
.super Lfreemarker/core/Configurable;
.source "Environment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/Environment$Namespace;,
        Lfreemarker/core/Environment$DateFormatKey;,
        Lfreemarker/core/Environment$NumberFormatKey;
    }
.end annotation


# static fields
.field private static final C_NUMBER_FORMAT:Ljava/text/DecimalFormat;

.field private static final EMPTY_BODY_WRITER:Ljava/io/Writer;

.field private static final NO_OUT_ARGS:[Lfreemarker/template/TemplateModel;

.field static final STACK_SECTION_SEPARATOR:Ljava/lang/String; = "----------"

.field private static final attemptLogger:Lfreemarker/log/Logger;

.field private static final localizedDateFormats:Ljava/util/Map;

.field private static final localizedNumberFormats:Ljava/util/Map;

.field private static final logger:Lfreemarker/log/Logger;

.field private static final threadEnv:Ljava/lang/ThreadLocal;


# instance fields
.field private cNumberFormat:Ljava/text/NumberFormat;

.field private cachedURLEscapingCharset:Ljava/lang/String;

.field private collator:Ljava/text/Collator;

.field private currentMacroContext:Lfreemarker/core/Macro$Context;

.field private currentNamespace:Lfreemarker/core/Environment$Namespace;

.field private currentNodeNS:Ljava/lang/String;

.field private currentNodeName:Ljava/lang/String;

.field private currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

.field private dateFormat:Ljava/text/DateFormat;

.field private dateFormats:[Ljava/util/Map;

.field private dateTimeFormat:Ljava/text/DateFormat;

.field private fastInvalidReferenceExceptions:Z

.field private globalNamespace:Lfreemarker/core/Environment$Namespace;

.field private inAttemptBlock:Z

.field private final instructionStack:Ljava/util/ArrayList;

.field private isoBuiltInCalendarFactory:Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

.field private lastReturnValue:Lfreemarker/template/TemplateModel;

.field private lastThrowable:Ljava/lang/Throwable;

.field private loadedLibs:Ljava/util/HashMap;

.field private localContextStack:Ljava/util/ArrayList;

.field private macroToNamespaceLookup:Ljava/util/HashMap;

.field private mainNamespace:Lfreemarker/core/Environment$Namespace;

.field private nodeNamespaceIndex:I

.field private nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

.field private numberFormat:Ljava/text/NumberFormat;

.field private numberFormats:Ljava/util/Map;

.field private out:Ljava/io/Writer;

.field private final recoveredErrorStack:Ljava/util/ArrayList;

.field private final rootDataModel:Lfreemarker/template/TemplateHashModel;

.field private timeFormat:Ljava/text/DateFormat;

.field private urlEscapingCharsetCached:Z


# direct methods
.method static constructor <clinit>()V
    .registers 5

    .prologue
    const/4 v4, 0x0

    .line 128
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    .line 130
    const-string v0, "freemarker.runtime"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/Environment;->logger:Lfreemarker/log/Logger;

    .line 131
    const-string v0, "freemarker.runtime.attempt"

    invoke-static {v0}, Lfreemarker/log/Logger;->getLogger(Ljava/lang/String;)Lfreemarker/log/Logger;

    move-result-object v0

    sput-object v0, Lfreemarker/core/Environment;->attemptLogger:Lfreemarker/log/Logger;

    .line 133
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/core/Environment;->localizedNumberFormats:Ljava/util/Map;

    .line 134
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lfreemarker/core/Environment;->localizedDateFormats:Ljava/util/Map;

    .line 138
    new-instance v0, Ljava/text/DecimalFormat;

    const-string v1, "0.################"

    new-instance v2, Ljava/text/DecimalFormatSymbols;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v2, v3}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    invoke-direct {v0, v1, v2}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    sput-object v0, Lfreemarker/core/Environment;->C_NUMBER_FORMAT:Ljava/text/DecimalFormat;

    .line 143
    sget-object v0, Lfreemarker/core/Environment;->C_NUMBER_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v0, v4}, Ljava/text/DecimalFormat;->setGroupingUsed(Z)V

    .line 144
    sget-object v0, Lfreemarker/core/Environment;->C_NUMBER_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v0, v4}, Ljava/text/DecimalFormat;->setDecimalSeparatorAlwaysShown(Z)V

    .line 298
    new-array v0, v4, [Lfreemarker/template/TemplateModel;

    sput-object v0, Lfreemarker/core/Environment;->NO_OUT_ARGS:[Lfreemarker/template/TemplateModel;

    .line 1923
    new-instance v0, Lfreemarker/core/Environment$6;

    invoke-direct {v0}, Lfreemarker/core/Environment$6;-><init>()V

    sput-object v0, Lfreemarker/core/Environment;->EMPTY_BODY_WRITER:Ljava/io/Writer;

    return-void
.end method

.method public constructor <init>(Lfreemarker/template/Template;Lfreemarker/template/TemplateHashModel;Ljava/io/Writer;)V
    .registers 6
    .param p1, "template"    # Lfreemarker/template/Template;
    .param p2, "rootDataModel"    # Lfreemarker/template/TemplateHashModel;
    .param p3, "out"    # Ljava/io/Writer;

    .prologue
    .line 203
    invoke-direct {p0, p1}, Lfreemarker/core/Configurable;-><init>(Lfreemarker/core/Configurable;)V

    .line 148
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    .line 149
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    .line 176
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Environment;->macroToNamespaceLookup:Ljava/util/HashMap;

    .line 204
    new-instance v0, Lfreemarker/core/Environment$Namespace;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfreemarker/core/Environment$Namespace;-><init>(Lfreemarker/core/Environment;Lfreemarker/template/Template;)V

    iput-object v0, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    .line 205
    new-instance v0, Lfreemarker/core/Environment$Namespace;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/Environment$Namespace;-><init>(Lfreemarker/core/Environment;Lfreemarker/template/Template;)V

    iput-object v0, p0, Lfreemarker/core/Environment;->mainNamespace:Lfreemarker/core/Environment$Namespace;

    iput-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 206
    iput-object p3, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 207
    iput-object p2, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    .line 208
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->importMacros(Lfreemarker/template/Template;)V

    .line 209
    return-void
.end method

.method static access$000(Lfreemarker/core/Environment;)Ljava/io/Writer;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Environment;

    .prologue
    .line 124
    iget-object v0, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    return-object v0
.end method

.method static access$002(Lfreemarker/core/Environment;Ljava/io/Writer;)Ljava/io/Writer;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Environment;
    .param p1, "x1"    # Ljava/io/Writer;

    .prologue
    .line 124
    iput-object p1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    return-object p1
.end method

.method static access$100(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateHashModel;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Environment;

    .prologue
    .line 124
    iget-object v0, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    return-object v0
.end method

.method static access$200(Lfreemarker/core/Environment;)Lfreemarker/core/Environment$Namespace;
    .registers 2
    .param p0, "x0"    # Lfreemarker/core/Environment;

    .prologue
    .line 124
    iget-object v0, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method private clearCachedValues()V
    .registers 2

    .prologue
    const/4 v0, 0x0

    .line 224
    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    .line 225
    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    .line 226
    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    .line 227
    iput-object v0, p0, Lfreemarker/core/Environment;->collator:Ljava/text/Collator;

    .line 228
    iput-object v0, p0, Lfreemarker/core/Environment;->cachedURLEscapingCharset:Ljava/lang/String;

    .line 229
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/core/Environment;->urlEscapingCharsetCached:Z

    .line 230
    return-void
.end method

.method public static getCurrentEnvironment()Lfreemarker/core/Environment;
    .registers 1

    .prologue
    .line 198
    sget-object v0, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Environment;

    return-object v0
.end method

.method private static getEnclosingMacro(Lfreemarker/core/TemplateElement;)Lfreemarker/core/Macro;
    .registers 2
    .param p0, "stackEl"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 1400
    :goto_0
    if-eqz p0, :cond_10

    .line 1401
    instance-of v0, p0, Lfreemarker/core/Macro;

    if-eqz v0, :cond_9

    check-cast p0, Lfreemarker/core/Macro;

    .line 1404
    .end local p0    # "stackEl":Lfreemarker/core/TemplateElement;
    :goto_8
    return-object p0

    .line 1402
    .restart local p0    # "stackEl":Lfreemarker/core/TemplateElement;
    :cond_9
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->getParent()Ljavax/swing/tree/TreeNode;

    move-result-object p0

    .end local p0    # "stackEl":Lfreemarker/core/TemplateElement;
    check-cast p0, Lfreemarker/core/TemplateElement;

    .restart local p0    # "stackEl":Lfreemarker/core/TemplateElement;
    goto :goto_0

    .line 1404
    :cond_10
    const/4 p0, 0x0

    goto :goto_8
.end method

.method private getNodeProcessor(Lfreemarker/core/Environment$Namespace;Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 9
    .param p1, "ns"    # Lfreemarker/core/Environment$Namespace;
    .param p2, "localName"    # Ljava/lang/String;
    .param p3, "nsURI"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1610
    const/4 v1, 0x0

    .line 1611
    .local v1, "result":Lfreemarker/template/TemplateModel;
    if-nez p3, :cond_12

    .line 1612
    invoke-virtual {p1, p2}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1613
    instance-of v3, v1, Lfreemarker/core/Macro;

    if-nez v3, :cond_10

    instance-of v3, v1, Lfreemarker/template/TemplateTransformModel;

    if-nez v3, :cond_10

    .line 1614
    const/4 v1, 0x0

    :cond_10
    :goto_10
    move-object v3, v1

    .line 1650
    :goto_11
    return-object v3

    .line 1617
    :cond_12
    invoke-virtual {p1}, Lfreemarker/core/Environment$Namespace;->getTemplate()Lfreemarker/template/Template;

    move-result-object v2

    .line 1618
    .local v2, "template":Lfreemarker/template/Template;
    invoke-virtual {v2, p3}, Lfreemarker/template/Template;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1619
    .local v0, "prefix":Ljava/lang/String;
    if-nez v0, :cond_1e

    .line 1622
    const/4 v3, 0x0

    goto :goto_11

    .line 1624
    :cond_1e
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_49

    .line 1625
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1626
    instance-of v3, v1, Lfreemarker/core/Macro;

    if-nez v3, :cond_10

    instance-of v3, v1, Lfreemarker/template/TemplateTransformModel;

    if-nez v3, :cond_10

    .line 1627
    const/4 v1, 0x0

    goto :goto_10

    .line 1630
    :cond_49
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v3

    if-nez v3, :cond_6f

    .line 1631
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "N:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1632
    instance-of v3, v1, Lfreemarker/core/Macro;

    if-nez v3, :cond_6f

    instance-of v3, v1, Lfreemarker/template/TemplateTransformModel;

    if-nez v3, :cond_6f

    .line 1633
    const/4 v1, 0x0

    .line 1636
    :cond_6f
    invoke-virtual {v2}, Lfreemarker/template/Template;->getDefaultNS()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p3, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_99

    .line 1637
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "D:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v3}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1638
    instance-of v3, v1, Lfreemarker/core/Macro;

    if-nez v3, :cond_99

    instance-of v3, v1, Lfreemarker/template/TemplateTransformModel;

    if-nez v3, :cond_99

    .line 1639
    const/4 v1, 0x0

    .line 1642
    :cond_99
    if-nez v1, :cond_10

    .line 1643
    invoke-virtual {p1, p2}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1644
    instance-of v3, v1, Lfreemarker/core/Macro;

    if-nez v3, :cond_10

    instance-of v3, v1, Lfreemarker/template/TemplateTransformModel;

    if-nez v3, :cond_10

    .line 1645
    const/4 v1, 0x0

    goto/16 :goto_10
.end method

.method private getNodeProcessor(Ljava/lang/String;Ljava/lang/String;I)Lfreemarker/template/TemplateModel;
    .registers 10
    .param p1, "nodeName"    # Ljava/lang/String;
    .param p2, "nsURI"    # Ljava/lang/String;
    .param p3, "startIndex"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1586
    const/4 v3, 0x0

    .line 1588
    .local v3, "result":Lfreemarker/template/TemplateModel;
    move v1, p3

    .local v1, "i":I
    :goto_2
    iget-object v4, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v4}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v4

    if-ge v1, v4, :cond_19

    .line 1589
    const/4 v2, 0x0

    .line 1591
    .local v2, "ns":Lfreemarker/core/Environment$Namespace;
    :try_start_b
    iget-object v4, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    invoke-interface {v4, v1}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .end local v2    # "ns":Lfreemarker/core/Environment$Namespace;
    check-cast v2, Lfreemarker/core/Environment$Namespace;
    :try_end_13
    .catch Ljava/lang/ClassCastException; {:try_start_b .. :try_end_13} :catch_24

    .line 1597
    .restart local v2    # "ns":Lfreemarker/core/Environment$Namespace;
    invoke-direct {p0, v2, p1, p2}, Lfreemarker/core/Environment;->getNodeProcessor(Lfreemarker/core/Environment$Namespace;Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    .line 1598
    if-eqz v3, :cond_2d

    .line 1601
    .end local v2    # "ns":Lfreemarker/core/Environment$Namespace;
    :cond_19
    if-eqz v3, :cond_23

    .line 1602
    add-int/lit8 v4, v1, 0x1

    iput v4, p0, Lfreemarker/core/Environment;->nodeNamespaceIndex:I

    .line 1603
    iput-object p1, p0, Lfreemarker/core/Environment;->currentNodeName:Ljava/lang/String;

    .line 1604
    iput-object p2, p0, Lfreemarker/core/Environment;->currentNodeNS:Ljava/lang/String;

    .line 1606
    :cond_23
    return-object v3

    .line 1592
    :catch_24
    move-exception v0

    .line 1593
    .local v0, "cce":Ljava/lang/ClassCastException;
    new-instance v4, Lfreemarker/core/_MiscTemplateException;

    const-string v5, "A \"using\" clause should contain a sequence of namespaces or strings that indicate the location of importable macro libraries."

    invoke-direct {v4, p0, v5}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v4

    .line 1588
    .end local v0    # "cce":Ljava/lang/ClassCastException;
    .restart local v2    # "ns":Lfreemarker/core/Environment$Namespace;
    :cond_2d
    add-int/lit8 v1, v1, 0x1

    goto :goto_2
.end method

.method private handleTemplateException(Lfreemarker/template/TemplateException;)V
    .registers 4
    .param p1, "te"    # Lfreemarker/template/TemplateException;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 749
    iget-object v0, p0, Lfreemarker/core/Environment;->lastThrowable:Ljava/lang/Throwable;

    if-ne v0, p1, :cond_5

    .line 750
    throw p1

    .line 752
    :cond_5
    iput-object p1, p0, Lfreemarker/core/Environment;->lastThrowable:Ljava/lang/Throwable;

    .line 755
    sget-object v0, Lfreemarker/core/Environment;->logger:Lfreemarker/log/Logger;

    invoke-virtual {v0}, Lfreemarker/log/Logger;->isErrorEnabled()Z

    move-result v0

    if-eqz v0, :cond_16

    .line 756
    sget-object v0, Lfreemarker/core/Environment;->logger:Lfreemarker/log/Logger;

    const-string v1, "Error executing FreeMarker template"

    invoke-virtual {v0, v1, p1}, Lfreemarker/log/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 761
    :cond_16
    instance-of v0, p1, Lfreemarker/core/StopException;

    if-eqz v0, :cond_1b

    .line 762
    throw p1

    .line 766
    :cond_1b
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTemplateExceptionHandler()Lfreemarker/template/TemplateExceptionHandler;

    move-result-object v0

    iget-object v1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    invoke-interface {v0, p1, p0, v1}, Lfreemarker/template/TemplateExceptionHandler;->handleTemplateException(Lfreemarker/template/TemplateException;Lfreemarker/core/Environment;Ljava/io/Writer;)V

    .line 767
    return-void
.end method

.method static instructionStackItemToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;
    .registers 6
    .param p0, "stackEl"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 1382
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 1383
    .local v1, "sb":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->getDescription()Ljava/lang/String;

    move-result-object v2

    const/16 v3, 0x28

    invoke-static {v2, v3}, Lfreemarker/core/MessageUtil;->shorten(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1385
    const-string v2, "  ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1386
    invoke-static {p0}, Lfreemarker/core/Environment;->getEnclosingMacro(Lfreemarker/core/TemplateElement;)Lfreemarker/core/Macro;

    move-result-object v0

    .line 1387
    .local v0, "enclosingMacro":Lfreemarker/core/Macro;
    if-eqz v0, :cond_32

    .line 1388
    iget v2, p0, Lfreemarker/core/TemplateElement;->beginLine:I

    iget v3, p0, Lfreemarker/core/TemplateElement;->beginColumn:I

    invoke-static {v0, v2, v3}, Lfreemarker/core/MessageUtil;->formatLocationForEvaluationError(Lfreemarker/core/Macro;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1394
    :goto_28
    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 1396
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 1391
    :cond_32
    invoke-virtual {p0}, Lfreemarker/core/TemplateElement;->getTemplate()Lfreemarker/template/Template;

    move-result-object v2

    iget v3, p0, Lfreemarker/core/TemplateElement;->beginLine:I

    iget v4, p0, Lfreemarker/core/TemplateElement;->beginColumn:I

    invoke-static {v2, v3, v4}, Lfreemarker/core/MessageUtil;->formatLocationForEvaluationError(Lfreemarker/template/Template;II)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_28
.end method

.method private noNodeHandlerDefinedDescription(Lfreemarker/template/TemplateNodeModel;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;
    .registers 9
    .param p1, "node"    # Lfreemarker/template/TemplateNodeModel;
    .param p2, "ns"    # Ljava/lang/String;
    .param p3, "nodeType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 590
    if-eqz p2, :cond_35

    .line 591
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_32

    .line 592
    const-string v0, " and namespace "

    .line 600
    .local v0, "nsPrefix":Ljava/lang/String;
    :goto_a
    const/4 v1, 0x7

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "No macro or directive is defined for node named "

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Lfreemarker/core/_DelayedJQuote;

    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v0, v1, v2

    const/4 v2, 0x3

    aput-object p2, v1, v2

    const/4 v2, 0x4

    const-string v3, ", and there is no fallback handler called @"

    aput-object v3, v1, v2

    const/4 v2, 0x5

    aput-object p3, v1, v2

    const/4 v2, 0x6

    const-string v3, " either."

    aput-object v3, v1, v2

    return-object v1

    .line 594
    .end local v0    # "nsPrefix":Ljava/lang/String;
    :cond_32
    const-string v0, " and no namespace"

    .restart local v0    # "nsPrefix":Ljava/lang/String;
    goto :goto_a

    .line 597
    .end local v0    # "nsPrefix":Ljava/lang/String;
    :cond_35
    const-string v0, ""

    .line 598
    .restart local v0    # "nsPrefix":Ljava/lang/String;
    const-string p2, ""

    goto :goto_a
.end method

.method static outputInstructionStack([Lfreemarker/core/TemplateElement;Ljava/io/PrintWriter;)V
    .registers 5
    .param p0, "instructionStackSnapshot"    # [Lfreemarker/core/TemplateElement;
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 1339
    const-string v2, "----------"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1340
    if-eqz p0, :cond_21

    .line 1341
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_8
    array-length v2, p0

    if-ge v0, v2, :cond_26

    .line 1342
    aget-object v1, p0, v0

    .line 1343
    .local v1, "stackEl":Lfreemarker/core/TemplateElement;
    if-nez v0, :cond_1e

    const-string v2, "==> "

    :goto_11
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 1344
    invoke-static {v1}, Lfreemarker/core/Environment;->instructionStackItemToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1341
    add-int/lit8 v0, v0, 0x1

    goto :goto_8

    .line 1343
    :cond_1e
    const-string v2, "    "

    goto :goto_11

    .line 1347
    .end local v0    # "i":I
    .end local v1    # "stackEl":Lfreemarker/core/TemplateElement;
    :cond_21
    const-string v2, "[the stack was empty]"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1349
    :cond_26
    const-string v2, "----------"

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 1350
    return-void
.end method

.method private popElement()V
    .registers 3

    .prologue
    .line 1537
    iget-object v0, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1538
    return-void
.end method

.method private popLocalContext()V
    .registers 3

    .prologue
    .line 1415
    iget-object v0, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 1416
    return-void
.end method

.method private pushElement(Lfreemarker/core/TemplateElement;)V
    .registers 3
    .param p1, "element"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 1533
    iget-object v0, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1534
    return-void
.end method

.method private pushLocalContext(Lfreemarker/core/LocalContext;)V
    .registers 3
    .param p1, "localContext"    # Lfreemarker/core/LocalContext;

    .prologue
    .line 1408
    iget-object v0, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    if-nez v0, :cond_b

    .line 1409
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 1411
    :cond_b
    iget-object v0, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1412
    return-void
.end method

.method private replaceTopElement(Lfreemarker/core/TemplateElement;)Lfreemarker/core/TemplateElement;
    .registers 4
    .param p1, "element"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 295
    iget-object v0, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/TemplateElement;

    return-object v0
.end method


# virtual methods
.method public __getitem__(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1835
    invoke-static {}, Lfreemarker/ext/beans/BeansWrapper;->getDefaultInstance()Lfreemarker/ext/beans/BeansWrapper;

    move-result-object v0

    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/ext/beans/BeansWrapper;->unwrap(Lfreemarker/template/TemplateModel;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public __setitem__(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1842
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    invoke-interface {v0, p2}, Lfreemarker/template/ObjectWrapper;->wrap(Ljava/lang/Object;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lfreemarker/core/Environment;->setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 1843
    return-void
.end method

.method public applyEqualsOperator(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 840
    const/4 v0, 0x1

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public applyEqualsOperatorLenient(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 852
    const/4 v0, 0x1

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compareLenient(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public applyGreaterThanOperator(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 882
    const/4 v0, 0x4

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public applyLessThanOperator(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 862
    const/4 v0, 0x3

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public applyLessThanOrEqualsOperator(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 872
    const/4 v0, 0x5

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method public applyWithGreaterThanOrEqualsOperator(Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateModel;)Z
    .registers 4
    .param p1, "leftValue"    # Lfreemarker/template/TemplateModel;
    .param p2, "rightValue"    # Lfreemarker/template/TemplateModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 892
    const/4 v0, 0x6

    invoke-static {p1, v0, p2, p0}, Lfreemarker/core/EvalUtil;->compare(Lfreemarker/template/TemplateModel;ILfreemarker/template/TemplateModel;Lfreemarker/core/Environment;)Z

    move-result v0

    return v0
.end method

.method clearLastReturnValue()V
    .registers 2

    .prologue
    .line 954
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->lastReturnValue:Lfreemarker/template/TemplateModel;

    .line 955
    return-void
.end method

.method fallback()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 606
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNodeName:Ljava/lang/String;

    iget-object v1, p0, Lfreemarker/core/Environment;->currentNodeNS:Ljava/lang/String;

    iget v3, p0, Lfreemarker/core/Environment;->nodeNamespaceIndex:I

    invoke-direct {p0, v0, v1, v3}, Lfreemarker/core/Environment;->getNodeProcessor(Ljava/lang/String;Ljava/lang/String;I)Lfreemarker/template/TemplateModel;

    move-result-object v6

    .line 607
    .local v6, "macroOrTransform":Lfreemarker/template/TemplateModel;
    instance-of v0, v6, Lfreemarker/core/Macro;

    if-eqz v0, :cond_1a

    move-object v1, v6

    .line 608
    check-cast v1, Lfreemarker/core/Macro;

    move-object v0, p0

    move-object v3, v2

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/Macro;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lfreemarker/core/TemplateElement;)V

    .line 613
    .end local v6    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    :cond_19
    :goto_19
    return-void

    .line 610
    .restart local v6    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    :cond_1a
    instance-of v0, v6, Lfreemarker/template/TemplateTransformModel;

    if-eqz v0, :cond_19

    .line 611
    check-cast v6, Lfreemarker/template/TemplateTransformModel;

    .end local v6    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    invoke-virtual {p0, v2, v6, v2}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V

    goto :goto_19
.end method

.method formatDate(Ljava/util/Date;I)Ljava/lang/String;
    .registers 7
    .param p1, "date"    # Ljava/util/Date;
    .param p2, "type"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 916
    invoke-virtual {p0, p2}, Lfreemarker/core/Environment;->getDateFormatObject(I)Ljava/text/DateFormat;

    move-result-object v0

    .line 917
    .local v0, "df":Ljava/text/DateFormat;
    if-nez v0, :cond_19

    .line 918
    new-instance v1, Lfreemarker/core/_TemplateModelException;

    new-instance v2, Lfreemarker/core/_ErrorDescriptionBuilder;

    const-string v3, "Can\'t convert the date to string, because it\'s not known which parts of the date variable are in use."

    invoke-direct {v2, v3}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TYPE_ERROR_TIPS:[Ljava/lang/String;

    invoke-virtual {v2, v3}, Lfreemarker/core/_ErrorDescriptionBuilder;->tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v1

    .line 923
    :cond_19
    invoke-virtual {v0, p1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method formatNumber(Ljava/lang/Number;)Ljava/lang/String;
    .registers 3
    .param p1, "number"    # Ljava/lang/Number;

    .prologue
    .line 904
    iget-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    if-nez v0, :cond_e

    .line 905
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getNumberFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->getNumberFormatObject(Ljava/lang/String;)Ljava/text/NumberFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    .line 907
    :cond_e
    iget-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    invoke-virtual {v0, p1}, Ljava/text/NumberFormat;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCNumberFormat()Ljava/text/NumberFormat;
    .registers 2

    .prologue
    .line 1154
    iget-object v0, p0, Lfreemarker/core/Environment;->cNumberFormat:Ljava/text/NumberFormat;

    if-nez v0, :cond_e

    .line 1155
    sget-object v0, Lfreemarker/core/Environment;->C_NUMBER_FORMAT:Ljava/text/DecimalFormat;

    invoke-virtual {v0}, Ljava/text/DecimalFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/text/DecimalFormat;

    iput-object v0, p0, Lfreemarker/core/Environment;->cNumberFormat:Ljava/text/NumberFormat;

    .line 1157
    :cond_e
    iget-object v0, p0, Lfreemarker/core/Environment;->cNumberFormat:Ljava/text/NumberFormat;

    return-object v0
.end method

.method getCollator()Ljava/text/Collator;
    .registers 2

    .prologue
    .line 827
    iget-object v0, p0, Lfreemarker/core/Environment;->collator:Ljava/text/Collator;

    if-nez v0, :cond_e

    .line 828
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Ljava/text/Collator;->getInstance(Ljava/util/Locale;)Ljava/text/Collator;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->collator:Ljava/text/Collator;

    .line 830
    :cond_e
    iget-object v0, p0, Lfreemarker/core/Environment;->collator:Ljava/text/Collator;

    return-object v0
.end method

.method public getConfiguration()Lfreemarker/template/Configuration;
    .registers 2

    .prologue
    .line 942
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Template;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v0

    return-object v0
.end method

.method getCurrentMacroContext()Lfreemarker/core/Macro$Context;
    .registers 2

    .prologue
    .line 741
    iget-object v0, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    return-object v0
.end method

.method public getCurrentNamespace()Lfreemarker/core/Environment$Namespace;
    .registers 2

    .prologue
    .line 1450
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method getCurrentRecoveredErrorMessage()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 455
    iget-object v0, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_10

    .line 456
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    const-string v1, ".error is not available outside of a #recover block"

    invoke-direct {v0, p0, v1}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v0

    .line 458
    :cond_10
    iget-object v0, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Throwable;

    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentVisitorNode()Lfreemarker/template/TemplateNodeModel;
    .registers 2

    .prologue
    .line 1545
    iget-object v0, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    return-object v0
.end method

.method public getDataModel()Lfreemarker/template/TemplateHashModel;
    .registers 3

    .prologue
    .line 1466
    new-instance v0, Lfreemarker/core/Environment$3;

    invoke-direct {v0, p0}, Lfreemarker/core/Environment$3;-><init>(Lfreemarker/core/Environment;)V

    .line 1480
    .local v0, "result":Lfreemarker/template/TemplateHashModel;
    iget-object v1, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    instance-of v1, v1, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v1, :cond_11

    .line 1481
    new-instance v1, Lfreemarker/core/Environment$4;

    invoke-direct {v1, p0, v0}, Lfreemarker/core/Environment$4;-><init>(Lfreemarker/core/Environment;Lfreemarker/template/TemplateHashModel;)V

    move-object v0, v1

    .line 1503
    .end local v0    # "result":Lfreemarker/template/TemplateHashModel;
    :cond_11
    return-object v0
.end method

.method getDateFormatObject(I)Ljava/text/DateFormat;
    .registers 6
    .param p1, "dateType"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1013
    packed-switch p1, :pswitch_data_4e

    .line 1036
    new-instance v0, Lfreemarker/core/_TemplateModelException;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    const-string v3, "Unrecognized date type: "

    aput-object v3, v1, v2

    const/4 v2, 0x1

    new-instance v3, Ljava/lang/Integer;

    invoke-direct {v3, p1}, Ljava/lang/Integer;-><init>(I)V

    aput-object v3, v1, v2

    invoke-direct {v0, v1}, Lfreemarker/core/_TemplateModelException;-><init>([Ljava/lang/Object;)V

    throw v0

    .line 1015
    :pswitch_19
    const/4 v0, 0x0

    .line 1033
    :goto_1a
    return-object v0

    .line 1018
    :pswitch_1b
    iget-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    if-nez v0, :cond_29

    .line 1019
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTimeFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lfreemarker/core/Environment;->getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    .line 1021
    :cond_29
    iget-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    goto :goto_1a

    .line 1024
    :pswitch_2c
    iget-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    if-nez v0, :cond_3a

    .line 1025
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getDateFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lfreemarker/core/Environment;->getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    .line 1027
    :cond_3a
    iget-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    goto :goto_1a

    .line 1030
    :pswitch_3d
    iget-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    if-nez v0, :cond_4b

    .line 1031
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getDateTimeFormat()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lfreemarker/core/Environment;->getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    .line 1033
    :cond_4b
    iget-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    goto :goto_1a

    .line 1013
    :pswitch_data_4e
    .packed-switch 0x0
        :pswitch_19
        :pswitch_1b
        :pswitch_2c
        :pswitch_3d
    .end packed-switch
.end method

.method getDateFormatObject(ILjava/lang/String;)Ljava/text/DateFormat;
    .registers 20
    .param p1, "dateType"    # I
    .param p2, "pattern"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1046
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    if-nez v12, :cond_3d

    .line 1047
    const/4 v12, 0x4

    new-array v12, v12, [Ljava/util/Map;

    move-object/from16 v0, p0

    iput-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    .line 1048
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    const/4 v13, 0x0

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    aput-object v14, v12, v13

    .line 1049
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    const/4 v13, 0x1

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    aput-object v14, v12, v13

    .line 1050
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    const/4 v13, 0x2

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    aput-object v14, v12, v13

    .line 1051
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    const/4 v13, 0x3

    new-instance v14, Ljava/util/HashMap;

    invoke-direct {v14}, Ljava/util/HashMap;-><init>()V

    aput-object v14, v12, v13

    .line 1053
    :cond_3d
    move-object/from16 v0, p0

    iget-object v12, v0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    aget-object v11, v12, p1

    .line 1055
    .local v11, "typedDateFormat":Ljava/util/Map;
    move-object/from16 v0, p2

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/text/DateFormat;

    .line 1056
    .local v5, "format":Ljava/text/DateFormat;
    if-eqz v5, :cond_4f

    move-object v6, v5

    .line 1113
    .end local v5    # "format":Ljava/text/DateFormat;
    .local v6, "format":Ljava/text/DateFormat;
    :goto_4e
    return-object v6

    .line 1061
    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    :cond_4f
    sget-object v13, Lfreemarker/core/Environment;->localizedDateFormats:Ljava/util/Map;

    monitor-enter v13

    .line 1062
    :try_start_52
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v7

    .line 1063
    .local v7, "locale":Ljava/util/Locale;
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/Environment;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v9

    .line 1064
    .local v9, "timeZone":Ljava/util/TimeZone;
    new-instance v4, Lfreemarker/core/Environment$DateFormatKey;

    move/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v4, v0, v1, v7, v9}, Lfreemarker/core/Environment$DateFormatKey;-><init>(ILjava/lang/String;Ljava/util/Locale;Ljava/util/TimeZone;)V

    .line 1065
    .local v4, "fk":Lfreemarker/core/Environment$DateFormatKey;
    sget-object v12, Lfreemarker/core/Environment;->localizedDateFormats:Ljava/util/Map;

    invoke-interface {v12, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    move-object v0, v12

    check-cast v0, Ljava/text/DateFormat;

    move-object v5, v0

    .line 1066
    if-nez v5, :cond_a0

    .line 1069
    new-instance v10, Ljava/util/StringTokenizer;

    const-string v12, "_"

    move-object/from16 v0, p2

    invoke-direct {v10, v0, v12}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 1070
    .local v10, "tok":Ljava/util/StringTokenizer;
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v12

    if-eqz v12, :cond_ae

    invoke-virtual {v10}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Environment;->parseDateStyleToken(Ljava/lang/String;)I
    :try_end_87
    .catchall {:try_start_52 .. :try_end_87} :catchall_c3

    move-result v2

    .line 1071
    .local v2, "dateStyle":I
    :goto_88
    const/4 v12, -0x1

    if-eq v2, v12, :cond_8e

    .line 1072
    packed-switch p1, :pswitch_data_116

    :cond_8e
    move-object v6, v5

    .line 1096
    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    :goto_8f
    if-nez v6, :cond_113

    .line 1098
    :try_start_91
    new-instance v5, Ljava/text/SimpleDateFormat;

    move-object/from16 v0, p2

    invoke-direct {v5, v0, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V
    :try_end_98
    .catch Ljava/lang/IllegalArgumentException; {:try_start_91 .. :try_end_98} :catch_ed
    .catchall {:try_start_91 .. :try_end_98} :catchall_110

    .line 1105
    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    :goto_98
    :try_start_98
    invoke-virtual {v5, v9}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 1106
    sget-object v12, Lfreemarker/core/Environment;->localizedDateFormats:Ljava/util/Map;

    invoke-interface {v12, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1108
    .end local v2    # "dateStyle":I
    .end local v10    # "tok":Ljava/util/StringTokenizer;
    :cond_a0
    monitor-exit v13
    :try_end_a1
    .catchall {:try_start_98 .. :try_end_a1} :catchall_c3

    .line 1111
    invoke-virtual {v5}, Ljava/text/DateFormat;->clone()Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "format":Ljava/text/DateFormat;
    check-cast v5, Ljava/text/DateFormat;

    .line 1112
    .restart local v5    # "format":Ljava/text/DateFormat;
    move-object/from16 v0, p2

    invoke-interface {v11, v0, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v6, v5

    .line 1113
    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    goto :goto_4e

    .line 1070
    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    .restart local v10    # "tok":Ljava/util/StringTokenizer;
    :cond_ae
    const/4 v2, 0x2

    goto :goto_88

    .line 1074
    .restart local v2    # "dateStyle":I
    :pswitch_b0
    :try_start_b0
    new-instance v12, Lfreemarker/core/_TemplateModelException;

    new-instance v14, Lfreemarker/core/_ErrorDescriptionBuilder;

    const-string v15, "Can\'t convert the date to string using a built-in format because it\'s not known which parts of the date are in use."

    invoke-direct {v14, v15}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>(Ljava/lang/String;)V

    sget-object v15, Lfreemarker/core/MessageUtil;->UNKNOWN_DATE_TO_STRING_TIPS:[Ljava/lang/String;

    invoke-virtual {v14, v15}, Lfreemarker/core/_ErrorDescriptionBuilder;->tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v14

    invoke-direct {v12, v14}, Lfreemarker/core/_TemplateModelException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v12

    .line 1108
    .end local v2    # "dateStyle":I
    .end local v4    # "fk":Lfreemarker/core/Environment$DateFormatKey;
    .end local v7    # "locale":Ljava/util/Locale;
    .end local v9    # "timeZone":Ljava/util/TimeZone;
    .end local v10    # "tok":Ljava/util/StringTokenizer;
    :catchall_c3
    move-exception v12

    :goto_c4
    monitor-exit v13
    :try_end_c5
    .catchall {:try_start_b0 .. :try_end_c5} :catchall_c3

    throw v12

    .line 1080
    .restart local v2    # "dateStyle":I
    .restart local v4    # "fk":Lfreemarker/core/Environment$DateFormatKey;
    .restart local v7    # "locale":Ljava/util/Locale;
    .restart local v9    # "timeZone":Ljava/util/TimeZone;
    .restart local v10    # "tok":Ljava/util/StringTokenizer;
    :pswitch_c6
    :try_start_c6
    invoke-static {v2, v7}, Ljava/text/DateFormat;->getTimeInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v5

    move-object v6, v5

    .line 1081
    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    goto :goto_8f

    .line 1084
    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    :pswitch_cc
    invoke-static {v2, v7}, Ljava/text/DateFormat;->getDateInstance(ILjava/util/Locale;)Ljava/text/DateFormat;

    move-result-object v5

    move-object v6, v5

    .line 1085
    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    goto :goto_8f

    .line 1088
    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    :pswitch_d2
    invoke-virtual {v10}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v12

    if-eqz v12, :cond_eb

    invoke-virtual {v10}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Environment;->parseDateStyleToken(Ljava/lang/String;)I

    move-result v8

    .line 1089
    .local v8, "timeStyle":I
    :goto_e2
    const/4 v12, -0x1

    if-eq v8, v12, :cond_8e

    .line 1090
    invoke-static {v2, v8, v7}, Ljava/text/DateFormat;->getDateTimeInstance(IILjava/util/Locale;)Ljava/text/DateFormat;
    :try_end_e8
    .catchall {:try_start_c6 .. :try_end_e8} :catchall_c3

    move-result-object v5

    move-object v6, v5

    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    goto :goto_8f

    .end local v6    # "format":Ljava/text/DateFormat;
    .end local v8    # "timeStyle":I
    .restart local v5    # "format":Ljava/text/DateFormat;
    :cond_eb
    move v8, v2

    .line 1088
    goto :goto_e2

    .line 1100
    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    :catch_ed
    move-exception v3

    .line 1101
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    :try_start_ee
    new-instance v12, Lfreemarker/core/_TemplateModelException;

    const/4 v14, 0x4

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "Can\'t parse "

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lfreemarker/core/_DelayedJQuote;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, " to a date format, because:\n"

    aput-object v16, v14, v15

    const/4 v15, 0x3

    aput-object v3, v14, v15

    invoke-direct {v12, v3, v14}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    throw v12
    :try_end_110
    .catchall {:try_start_ee .. :try_end_110} :catchall_110

    .line 1108
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_110
    move-exception v12

    move-object v5, v6

    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    goto :goto_c4

    .end local v5    # "format":Ljava/text/DateFormat;
    .restart local v6    # "format":Ljava/text/DateFormat;
    :cond_113
    move-object v5, v6

    .end local v6    # "format":Ljava/text/DateFormat;
    .restart local v5    # "format":Ljava/text/DateFormat;
    goto :goto_98

    .line 1072
    nop

    :pswitch_data_116
    .packed-switch 0x0
        :pswitch_b0
        :pswitch_c6
        :pswitch_cc
        :pswitch_d2
    .end packed-switch
.end method

.method public getDefaultNS()Ljava/lang/String;
    .registers 2

    .prologue
    .line 1828
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0}, Lfreemarker/core/Environment$Namespace;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Template;->getDefaultNS()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getEffectiveURLEscapingCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 816
    iget-boolean v0, p0, Lfreemarker/core/Environment;->urlEscapingCharsetCached:Z

    if-nez v0, :cond_17

    .line 817
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getURLEscapingCharset()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->cachedURLEscapingCharset:Ljava/lang/String;

    .line 818
    iget-object v0, p0, Lfreemarker/core/Environment;->cachedURLEscapingCharset:Ljava/lang/String;

    if-nez v0, :cond_14

    .line 819
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getOutputEncoding()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Environment;->cachedURLEscapingCharset:Ljava/lang/String;

    .line 821
    :cond_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/Environment;->urlEscapingCharsetCached:Z

    .line 823
    :cond_17
    iget-object v0, p0, Lfreemarker/core/Environment;->cachedURLEscapingCharset:Ljava/lang/String;

    return-object v0
.end method

.method getFastInvalidReferenceExceptions()Z
    .registers 2

    .prologue
    .line 1943
    iget-boolean v0, p0, Lfreemarker/core/Environment;->fastInvalidReferenceExceptions:Z

    return v0
.end method

.method public getGlobalNamespace()Lfreemarker/core/Environment$Namespace;
    .registers 2

    .prologue
    .line 1461
    iget-object v0, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method public getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1230
    iget-object v1, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v1, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1231
    .local v0, "result":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_e

    .line 1232
    iget-object v1, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    invoke-interface {v1, p1}, Lfreemarker/template/TemplateHashModel;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1234
    :cond_e
    if-nez v0, :cond_18

    .line 1235
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v1

    invoke-virtual {v1, p1}, Lfreemarker/template/Configuration;->getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1237
    :cond_18
    return-object v0
.end method

.method public getGlobalVariables()Lfreemarker/template/TemplateHashModel;
    .registers 2

    .prologue
    .line 1515
    new-instance v0, Lfreemarker/core/Environment$5;

    invoke-direct {v0, p0}, Lfreemarker/core/Environment$5;-><init>(Lfreemarker/core/Environment;)V

    return-object v0
.end method

.method getISOBuiltInCalendar()Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;
    .registers 2

    .prologue
    .line 1140
    iget-object v0, p0, Lfreemarker/core/Environment;->isoBuiltInCalendarFactory:Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    if-nez v0, :cond_b

    .line 1141
    new-instance v0, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;

    invoke-direct {v0}, Lfreemarker/template/utility/DateUtil$TrivialDateToISO8601CalendarFactory;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Environment;->isoBuiltInCalendarFactory:Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    .line 1143
    :cond_b
    iget-object v0, p0, Lfreemarker/core/Environment;->isoBuiltInCalendarFactory:Lfreemarker/template/utility/DateUtil$DateToISO8601CalendarFactory;

    return-object v0
.end method

.method getInstructionStackSnapshot()[Lfreemarker/core/TemplateElement;
    .registers 9

    .prologue
    .line 1357
    const/4 v4, 0x0

    .line 1358
    .local v4, "requiredLength":I
    iget-object v7, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v3

    .line 1360
    .local v3, "ln":I
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_8
    if-ge v2, v3, :cond_1f

    .line 1361
    iget-object v7, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/core/TemplateElement;

    .line 1362
    .local v6, "stackEl":Lfreemarker/core/TemplateElement;
    if-eq v2, v3, :cond_1a

    invoke-virtual {v6}, Lfreemarker/core/TemplateElement;->isShownInStackTrace()Z

    move-result v7

    if-eqz v7, :cond_1c

    .line 1363
    :cond_1a
    add-int/lit8 v4, v4, 0x1

    .line 1360
    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    .line 1367
    .end local v6    # "stackEl":Lfreemarker/core/TemplateElement;
    :cond_1f
    if-nez v4, :cond_23

    const/4 v5, 0x0

    .line 1378
    :cond_22
    return-object v5

    .line 1369
    :cond_23
    new-array v5, v4, [Lfreemarker/core/TemplateElement;

    .line 1370
    .local v5, "result":[Lfreemarker/core/TemplateElement;
    add-int/lit8 v0, v4, -0x1

    .line 1371
    .local v0, "dstIdx":I
    const/4 v2, 0x0

    move v1, v0

    .end local v0    # "dstIdx":I
    .local v1, "dstIdx":I
    :goto_29
    if-ge v2, v3, :cond_22

    .line 1372
    iget-object v7, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v7, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lfreemarker/core/TemplateElement;

    .line 1373
    .restart local v6    # "stackEl":Lfreemarker/core/TemplateElement;
    if-eq v2, v3, :cond_3b

    invoke-virtual {v6}, Lfreemarker/core/TemplateElement;->isShownInStackTrace()Z

    move-result v7

    if-eqz v7, :cond_43

    .line 1374
    :cond_3b
    add-int/lit8 v0, v1, -0x1

    .end local v1    # "dstIdx":I
    .restart local v0    # "dstIdx":I
    aput-object v6, v5, v1

    .line 1371
    :goto_3f
    add-int/lit8 v2, v2, 0x1

    move v1, v0

    .end local v0    # "dstIdx":I
    .restart local v1    # "dstIdx":I
    goto :goto_29

    :cond_43
    move v0, v1

    .end local v1    # "dstIdx":I
    .restart local v0    # "dstIdx":I
    goto :goto_3f
.end method

.method public getKnownVariableNames()Ljava/util/Set;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1289
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v5

    invoke-virtual {v5}, Lfreemarker/template/Configuration;->getSharedVariableNames()Ljava/util/Set;

    move-result-object v3

    .line 1292
    .local v3, "set":Ljava/util/Set;
    iget-object v5, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    instance-of v5, v5, Lfreemarker/template/TemplateHashModelEx;

    if-eqz v5, :cond_2e

    .line 1293
    iget-object v5, p0, Lfreemarker/core/Environment;->rootDataModel:Lfreemarker/template/TemplateHashModel;

    check-cast v5, Lfreemarker/template/TemplateHashModelEx;

    invoke-interface {v5}, Lfreemarker/template/TemplateHashModelEx;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v5

    invoke-interface {v5}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v2

    .line 1295
    .local v2, "rootNames":Lfreemarker/template/TemplateModelIterator;
    :goto_1a
    invoke-interface {v2}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2e

    .line 1296
    invoke-interface {v2}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v5

    check-cast v5, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v5}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    .line 1301
    .end local v2    # "rootNames":Lfreemarker/template/TemplateModelIterator;
    :cond_2e
    iget-object v5, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5}, Lfreemarker/core/Environment$Namespace;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v5

    invoke-interface {v5}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v4

    .local v4, "tmi":Lfreemarker/template/TemplateModelIterator;
    :goto_38
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4c

    .line 1302
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v5

    check-cast v5, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v5}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_38

    .line 1306
    :cond_4c
    iget-object v5, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5}, Lfreemarker/core/Environment$Namespace;->keys()Lfreemarker/template/TemplateCollectionModel;

    move-result-object v5

    invoke-interface {v5}, Lfreemarker/template/TemplateCollectionModel;->iterator()Lfreemarker/template/TemplateModelIterator;

    move-result-object v4

    :goto_56
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6a

    .line 1307
    invoke-interface {v4}, Lfreemarker/template/TemplateModelIterator;->next()Lfreemarker/template/TemplateModel;

    move-result-object v5

    check-cast v5, Lfreemarker/template/TemplateScalarModel;

    invoke-interface {v5}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_56

    .line 1311
    :cond_6a
    iget-object v5, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    if-eqz v5, :cond_77

    .line 1312
    iget-object v5, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    invoke-virtual {v5}, Lfreemarker/core/Macro$Context;->getLocalVariableNames()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1314
    :cond_77
    iget-object v5, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    if-eqz v5, :cond_97

    .line 1315
    iget-object v5, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    add-int/lit8 v0, v5, -0x1

    .local v0, "i":I
    :goto_83
    if-ltz v0, :cond_97

    .line 1316
    iget-object v5, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/LocalContext;

    .line 1317
    .local v1, "lc":Lfreemarker/core/LocalContext;
    invoke-interface {v1}, Lfreemarker/core/LocalContext;->getLocalVariableNames()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 1315
    add-int/lit8 v0, v0, -0x1

    goto :goto_83

    .line 1320
    .end local v0    # "i":I
    .end local v1    # "lc":Lfreemarker/core/LocalContext;
    :cond_97
    return-object v3
.end method

.method getLastReturnValue()Lfreemarker/template/TemplateModel;
    .registers 2

    .prologue
    .line 946
    iget-object v0, p0, Lfreemarker/core/Environment;->lastReturnValue:Lfreemarker/template/TemplateModel;

    return-object v0
.end method

.method getLocalContextStack()Ljava/util/ArrayList;
    .registers 2

    .prologue
    .line 1419
    iget-object v0, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1182
    iget-object v3, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    if-eqz v3, :cond_20

    .line 1183
    iget-object v3, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/lit8 v0, v3, -0x1

    .local v0, "i":I
    :goto_c
    if-ltz v0, :cond_20

    .line 1184
    iget-object v3, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/LocalContext;

    .line 1185
    .local v1, "lc":Lfreemarker/core/LocalContext;
    invoke-interface {v1, p1}, Lfreemarker/core/LocalContext;->getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v2

    .line 1186
    .local v2, "tm":Lfreemarker/template/TemplateModel;
    if-eqz v2, :cond_1d

    .line 1191
    .end local v0    # "i":I
    .end local v1    # "lc":Lfreemarker/core/LocalContext;
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    :goto_1c
    return-object v2

    .line 1183
    .restart local v0    # "i":I
    .restart local v1    # "lc":Lfreemarker/core/LocalContext;
    .restart local v2    # "tm":Lfreemarker/template/TemplateModel;
    :cond_1d
    add-int/lit8 v0, v0, -0x1

    goto :goto_c

    .line 1191
    .end local v0    # "i":I
    .end local v1    # "lc":Lfreemarker/core/LocalContext;
    .end local v2    # "tm":Lfreemarker/template/TemplateModel;
    :cond_20
    iget-object v3, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    if-nez v3, :cond_27

    const/4 v3, 0x0

    :goto_25
    move-object v2, v3

    goto :goto_1c

    :cond_27
    iget-object v3, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    invoke-virtual {v3, p1}, Lfreemarker/core/Macro$Context;->getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v3

    goto :goto_25
.end method

.method getMacroNamespace(Lfreemarker/core/Macro;)Lfreemarker/core/Environment$Namespace;
    .registers 3
    .param p1, "macro"    # Lfreemarker/core/Macro;

    .prologue
    .line 717
    iget-object v0, p0, Lfreemarker/core/Environment;->macroToNamespaceLookup:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method public getMainNamespace()Lfreemarker/core/Environment$Namespace;
    .registers 2

    .prologue
    .line 1442
    iget-object v0, p0, Lfreemarker/core/Environment;->mainNamespace:Lfreemarker/core/Environment$Namespace;

    return-object v0
.end method

.method public getNamespace(Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;
    .registers 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1429
    const-string v0, "/"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    .line 1430
    :cond_d
    iget-object v0, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    if-eqz v0, :cond_1a

    .line 1431
    iget-object v0, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Environment$Namespace;

    .line 1433
    :goto_19
    return-object v0

    :cond_1a
    const/4 v0, 0x0

    goto :goto_19
.end method

.method public getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 1817
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0}, Lfreemarker/core/Environment$Namespace;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfreemarker/template/Template;->getNamespaceForPrefix(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method getNodeProcessor(Lfreemarker/template/TemplateNodeModel;)Lfreemarker/template/TemplateModel;
    .registers 8
    .param p1, "node"    # Lfreemarker/template/TemplateNodeModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 1556
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getNodeName()Ljava/lang/String;

    move-result-object v0

    .line 1557
    .local v0, "nodeName":Ljava/lang/String;
    if-nez v0, :cond_f

    .line 1558
    new-instance v3, Lfreemarker/core/_MiscTemplateException;

    const-string v4, "Node name is null."

    invoke-direct {v3, p0, v4}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;Ljava/lang/String;)V

    throw v3

    .line 1560
    :cond_f
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v0, v3, v5}, Lfreemarker/core/Environment;->getNodeProcessor(Ljava/lang/String;Ljava/lang/String;I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1562
    .local v1, "result":Lfreemarker/template/TemplateModel;
    if-nez v1, :cond_39

    .line 1563
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getNodeType()Ljava/lang/String;

    move-result-object v2

    .line 1566
    .local v2, "type":Ljava/lang/String;
    if-nez v2, :cond_21

    .line 1567
    const-string v2, "default"

    .line 1569
    :cond_21
    new-instance v3, Ljava/lang/StringBuffer;

    invoke-direct {v3}, Ljava/lang/StringBuffer;-><init>()V

    const-string v4, "@"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {p0, v3, v4, v5}, Lfreemarker/core/Environment;->getNodeProcessor(Ljava/lang/String;Ljava/lang/String;I)Lfreemarker/template/TemplateModel;

    move-result-object v1

    .line 1580
    .end local v2    # "type":Ljava/lang/String;
    :cond_39
    return-object v1
.end method

.method getNumberFormatObject(Ljava/lang/String;)Ljava/text/NumberFormat;
    .registers 10
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    .line 959
    iget-object v5, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    if-nez v5, :cond_b

    .line 960
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    .line 963
    :cond_b
    iget-object v5, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    invoke-interface {v5, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/text/NumberFormat;

    .line 964
    .local v2, "format":Ljava/text/NumberFormat;
    if-eqz v2, :cond_17

    move-object v3, v2

    .line 1006
    .end local v2    # "format":Ljava/text/NumberFormat;
    .local v3, "format":Ljava/text/NumberFormat;
    :goto_16
    return-object v3

    .line 970
    .end local v3    # "format":Ljava/text/NumberFormat;
    .restart local v2    # "format":Ljava/text/NumberFormat;
    :cond_17
    sget-object v6, Lfreemarker/core/Environment;->localizedNumberFormats:Ljava/util/Map;

    monitor-enter v6

    .line 972
    :try_start_1a
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v4

    .line 973
    .local v4, "locale":Ljava/util/Locale;
    new-instance v1, Lfreemarker/core/Environment$NumberFormatKey;

    invoke-direct {v1, p1, v4}, Lfreemarker/core/Environment$NumberFormatKey;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 974
    .local v1, "fk":Lfreemarker/core/Environment$NumberFormatKey;
    sget-object v5, Lfreemarker/core/Environment;->localizedNumberFormats:Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    move-object v0, v5

    check-cast v0, Ljava/text/NumberFormat;

    move-object v2, v0

    .line 975
    if-nez v2, :cond_40

    .line 979
    const-string v5, "number"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_4e

    .line 981
    invoke-static {v4}, Ljava/text/NumberFormat;->getNumberInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v2

    .line 999
    :goto_3b
    sget-object v5, Lfreemarker/core/Environment;->localizedNumberFormats:Ljava/util/Map;

    invoke-interface {v5, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1001
    :cond_40
    monitor-exit v6
    :try_end_41
    .catchall {:try_start_1a .. :try_end_41} :catchall_85

    .line 1004
    invoke-virtual {v2}, Ljava/text/NumberFormat;->clone()Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "format":Ljava/text/NumberFormat;
    check-cast v2, Ljava/text/NumberFormat;

    .line 1005
    .restart local v2    # "format":Ljava/text/NumberFormat;
    iget-object v5, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    invoke-interface {v5, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object v3, v2

    .line 1006
    .end local v2    # "format":Ljava/text/NumberFormat;
    .restart local v3    # "format":Ljava/text/NumberFormat;
    goto :goto_16

    .line 983
    .end local v3    # "format":Ljava/text/NumberFormat;
    .restart local v2    # "format":Ljava/text/NumberFormat;
    :cond_4e
    :try_start_4e
    const-string v5, "currency"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_5b

    .line 985
    invoke-static {v4}, Ljava/text/NumberFormat;->getCurrencyInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v2

    goto :goto_3b

    .line 987
    :cond_5b
    const-string v5, "percent"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_68

    .line 989
    invoke-static {v4}, Ljava/text/NumberFormat;->getPercentInstance(Ljava/util/Locale;)Ljava/text/NumberFormat;

    move-result-object v2

    goto :goto_3b

    .line 991
    :cond_68
    const-string v5, "computer"

    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_75

    .line 993
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getCNumberFormat()Ljava/text/NumberFormat;

    move-result-object v2

    goto :goto_3b

    .line 997
    :cond_75
    new-instance v3, Ljava/text/DecimalFormat;

    new-instance v5, Ljava/text/DecimalFormatSymbols;

    invoke-virtual {p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v7

    invoke-direct {v5, v7}, Ljava/text/DecimalFormatSymbols;-><init>(Ljava/util/Locale;)V

    invoke-direct {v3, p1, v5}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;Ljava/text/DecimalFormatSymbols;)V

    .end local v2    # "format":Ljava/text/NumberFormat;
    .restart local v3    # "format":Ljava/text/NumberFormat;
    move-object v2, v3

    .end local v3    # "format":Ljava/text/NumberFormat;
    .restart local v2    # "format":Ljava/text/NumberFormat;
    goto :goto_3b

    .line 1001
    .end local v1    # "fk":Lfreemarker/core/Environment$NumberFormatKey;
    .end local v4    # "locale":Ljava/util/Locale;
    :catchall_85
    move-exception v5

    monitor-exit v6
    :try_end_87
    .catchall {:try_start_4e .. :try_end_87} :catchall_85

    throw v5
.end method

.method public getOut()Ljava/io/Writer;
    .registers 2

    .prologue
    .line 900
    iget-object v0, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    return-object v0
.end method

.method public getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "nsURI"    # Ljava/lang/String;

    .prologue
    .line 1821
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0}, Lfreemarker/core/Environment$Namespace;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0, p1}, Lfreemarker/template/Template;->getPrefixForNamespace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTemplate()Lfreemarker/template/Template;
    .registers 2

    .prologue
    .line 216
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getParent()Lfreemarker/core/Configurable;

    move-result-object v0

    check-cast v0, Lfreemarker/template/Template;

    return-object v0
.end method

.method public getTemplateForImporting(Ljava/lang/String;)Lfreemarker/template/Template;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1748
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, p1, v0, v1}, Lfreemarker/core/Environment;->getTemplateForInclusion(Ljava/lang/String;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    return-object v0
.end method

.method public getTemplateForInclusion(Ljava/lang/String;Ljava/lang/String;Z)Lfreemarker/template/Template;
    .registers 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "parse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1688
    if-nez p2, :cond_a

    .line 1689
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {v0}, Lfreemarker/template/Template;->getEncoding()Ljava/lang/String;

    move-result-object p2

    .line 1691
    :cond_a
    if-nez p2, :cond_18

    .line 1692
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, v1}, Lfreemarker/template/Configuration;->getEncoding(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p2

    .line 1694
    :cond_18
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v0

    invoke-virtual {p0}, Lfreemarker/core/Environment;->getLocale()Ljava/util/Locale;

    move-result-object v1

    invoke-virtual {v0, p1, v1, p2, p3}, Lfreemarker/template/Configuration;->getTemplate(Ljava/lang/String;Ljava/util/Locale;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    return-object v0
.end method

.method getTransform(Lfreemarker/core/Expression;)Lfreemarker/template/TemplateTransformModel;
    .registers 6
    .param p1, "exp"    # Lfreemarker/core/Expression;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1161
    const/4 v1, 0x0

    .line 1162
    .local v1, "ttm":Lfreemarker/template/TemplateTransformModel;
    invoke-virtual {p1, p0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1163
    .local v0, "tm":Lfreemarker/template/TemplateModel;
    instance-of v2, v0, Lfreemarker/template/TemplateTransformModel;

    if-eqz v2, :cond_d

    move-object v1, v0

    .line 1164
    check-cast v1, Lfreemarker/template/TemplateTransformModel;

    .line 1172
    :cond_c
    :goto_c
    return-object v1

    .line 1166
    :cond_d
    instance-of v2, p1, Lfreemarker/core/Identifier;

    if-eqz v2, :cond_c

    .line 1167
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getConfiguration()Lfreemarker/template/Configuration;

    move-result-object v2

    invoke-virtual {p1}, Lfreemarker/core/Expression;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lfreemarker/template/Configuration;->getSharedVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1168
    instance-of v2, v0, Lfreemarker/template/TemplateTransformModel;

    if-eqz v2, :cond_c

    move-object v1, v0

    .line 1169
    check-cast v1, Lfreemarker/template/TemplateTransformModel;

    goto :goto_c
.end method

.method public getVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateModelException;
        }
    .end annotation

    .prologue
    .line 1213
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->getLocalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1214
    .local v0, "result":Lfreemarker/template/TemplateModel;
    if-nez v0, :cond_c

    .line 1215
    iget-object v1, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v1, p1}, Lfreemarker/core/Environment$Namespace;->get(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1217
    :cond_c
    if-nez v0, :cond_12

    .line 1218
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->getGlobalVariable(Ljava/lang/String;)Lfreemarker/template/TemplateModel;

    move-result-object v0

    .line 1220
    :cond_12
    return-object v0
.end method

.method public importLib(Lfreemarker/template/Template;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;
    .registers 10
    .param p1, "loadedTemplate"    # Lfreemarker/template/Template;
    .param p2, "namespace"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1760
    iget-object v5, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    if-nez v5, :cond_b

    .line 1761
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    iput-object v5, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    .line 1763
    :cond_b
    invoke-virtual {p1}, Lfreemarker/template/Template;->getName()Ljava/lang/String;

    move-result-object v4

    .line 1764
    .local v4, "templateName":Ljava/lang/String;
    iget-object v5, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Environment$Namespace;

    .line 1765
    .local v0, "existingNamespace":Lfreemarker/core/Environment$Namespace;
    if-eqz v0, :cond_27

    .line 1766
    if-eqz p2, :cond_1e

    .line 1767
    invoke-virtual {p0, p2, v0}, Lfreemarker/core/Environment;->setVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 1790
    :cond_1e
    :goto_1e
    iget-object v5, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/core/Environment$Namespace;

    return-object v5

    .line 1771
    :cond_27
    new-instance v1, Lfreemarker/core/Environment$Namespace;

    invoke-direct {v1, p0, p1}, Lfreemarker/core/Environment$Namespace;-><init>(Lfreemarker/core/Environment;Lfreemarker/template/Template;)V

    .line 1772
    .local v1, "newNamespace":Lfreemarker/core/Environment$Namespace;
    if-eqz p2, :cond_3e

    .line 1773
    iget-object v5, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5, p2, v1}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1774
    iget-object v5, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    iget-object v6, p0, Lfreemarker/core/Environment;->mainNamespace:Lfreemarker/core/Environment$Namespace;

    if-ne v5, v6, :cond_3e

    .line 1775
    iget-object v5, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5, p2, v1}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1778
    :cond_3e
    iget-object v2, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 1779
    .local v2, "prevNamespace":Lfreemarker/core/Environment$Namespace;
    iput-object v1, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 1780
    iget-object v5, p0, Lfreemarker/core/Environment;->loadedLibs:Ljava/util/HashMap;

    iget-object v6, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1781
    iget-object v3, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1782
    .local v3, "prevOut":Ljava/io/Writer;
    sget-object v5, Lfreemarker/template/utility/NullWriter;->INSTANCE:Lfreemarker/template/utility/NullWriter;

    iput-object v5, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1784
    :try_start_4f
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->include(Lfreemarker/template/Template;)V
    :try_end_52
    .catchall {:try_start_4f .. :try_end_52} :catchall_57

    .line 1786
    iput-object v3, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1787
    iput-object v2, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    goto :goto_1e

    .line 1786
    :catchall_57
    move-exception v5

    iput-object v3, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1787
    iput-object v2, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    throw v5
.end method

.method public importLib(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "namespace"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1733
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->getTemplateForImporting(Ljava/lang/String;)Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {p0, v0, p2}, Lfreemarker/core/Environment;->importLib(Lfreemarker/template/Template;Ljava/lang/String;)Lfreemarker/core/Environment$Namespace;

    move-result-object v0

    return-object v0
.end method

.method importMacros(Lfreemarker/template/Template;)V
    .registers 4
    .param p1, "template"    # Lfreemarker/template/Template;

    .prologue
    .line 1807
    invoke-virtual {p1}, Lfreemarker/template/Template;->getMacros()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "it":Ljava/util/Iterator;
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    .line 1808
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfreemarker/core/Macro;

    invoke-virtual {p0, v1}, Lfreemarker/core/Environment;->visitMacroDef(Lfreemarker/core/Macro;)V

    goto :goto_c

    .line 1810
    :cond_1c
    return-void
.end method

.method public include(Lfreemarker/template/Template;)V
    .registers 4
    .param p1, "includedTemplate"    # Lfreemarker/template/Template;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1708
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v0

    .line 1709
    .local v0, "prevTemplate":Lfreemarker/template/Template;
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    .line 1710
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->importMacros(Lfreemarker/template/Template;)V

    .line 1712
    :try_start_a
    invoke-virtual {p1}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V
    :try_end_11
    .catchall {:try_start_a .. :try_end_11} :catchall_15

    .line 1715
    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    .line 1717
    return-void

    .line 1715
    :catchall_15
    move-exception v1

    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    throw v1
.end method

.method public include(Ljava/lang/String;Ljava/lang/String;Z)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "encoding"    # Ljava/lang/String;
    .param p3, "parse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1667
    invoke-virtual {p0, p1, p2, p3}, Lfreemarker/core/Environment;->getTemplateForInclusion(Ljava/lang/String;Ljava/lang/String;Z)Lfreemarker/template/Template;

    move-result-object v0

    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->include(Lfreemarker/template/Template;)V

    .line 1668
    return-void
.end method

.method public isInAttemptBlock()Z
    .registers 2

    .prologue
    .line 469
    iget-boolean v0, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    return v0
.end method

.method public outputInstructionStack(Ljava/io/PrintWriter;)V
    .registers 3
    .param p1, "pw"    # Ljava/io/PrintWriter;

    .prologue
    .line 1328
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getInstructionStackSnapshot()[Lfreemarker/core/TemplateElement;

    move-result-object v0

    invoke-static {v0, p1}, Lfreemarker/core/Environment;->outputInstructionStack([Lfreemarker/core/TemplateElement;Ljava/io/PrintWriter;)V

    .line 1329
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 1330
    return-void
.end method

.method parseDateStyleToken(Ljava/lang/String;)I
    .registers 3
    .param p1, "token"    # Ljava/lang/String;

    .prologue
    .line 1117
    const-string v0, "short"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 1118
    const/4 v0, 0x3

    .line 1129
    :goto_9
    return v0

    .line 1120
    :cond_a
    const-string v0, "medium"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14

    .line 1121
    const/4 v0, 0x2

    goto :goto_9

    .line 1123
    :cond_14
    const-string v0, "long"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 1124
    const/4 v0, 0x1

    goto :goto_9

    .line 1126
    :cond_1e
    const-string v0, "full"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_28

    .line 1127
    const/4 v0, 0x0

    goto :goto_9

    .line 1129
    :cond_28
    const/4 v0, -0x1

    goto :goto_9
.end method

.method public process()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 236
    sget-object v1, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    invoke-virtual {v1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    .line 237
    .local v0, "savedEnv":Ljava/lang/Object;
    sget-object v1, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, p0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 240
    :try_start_b
    invoke-direct {p0}, Lfreemarker/core/Environment;->clearCachedValues()V
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_35

    .line 242
    :try_start_e
    invoke-virtual {p0, p0}, Lfreemarker/core/Environment;->doAutoImportsAndIncludes(Lfreemarker/core/Environment;)V

    .line 243
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getTemplate()Lfreemarker/template/Template;

    move-result-object v1

    invoke-virtual {v1}, Lfreemarker/template/Template;->getRootTreeNode()Lfreemarker/core/TemplateElement;

    move-result-object v1

    invoke-virtual {p0, v1}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 245
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getAutoFlush()Z

    move-result v1

    if-eqz v1, :cond_27

    .line 246
    iget-object v1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    invoke-virtual {v1}, Ljava/io/Writer;->flush()V
    :try_end_27
    .catchall {:try_start_e .. :try_end_27} :catchall_30

    .line 250
    :cond_27
    :try_start_27
    invoke-direct {p0}, Lfreemarker/core/Environment;->clearCachedValues()V
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_35

    .line 253
    sget-object v1, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    .line 255
    return-void

    .line 250
    :catchall_30
    move-exception v1

    :try_start_31
    invoke-direct {p0}, Lfreemarker/core/Environment;->clearCachedValues()V

    throw v1
    :try_end_35
    .catchall {:try_start_31 .. :try_end_35} :catchall_35

    .line 253
    :catchall_35
    move-exception v1

    sget-object v2, Lfreemarker/core/Environment;->threadEnv:Ljava/lang/ThreadLocal;

    invoke-virtual {v2, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    throw v1
.end method

.method recurse(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V
    .registers 8
    .param p1, "node"    # Lfreemarker/template/TemplateNodeModel;
    .param p2, "namespaces"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 723
    if-nez p1, :cond_10

    .line 724
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getCurrentVisitorNode()Lfreemarker/template/TemplateNodeModel;

    move-result-object p1

    .line 725
    if-nez p1, :cond_10

    .line 726
    new-instance v3, Lfreemarker/core/_TemplateModelException;

    const-string v4, "The target node of recursion is missing or null."

    invoke-direct {v3, v4}, Lfreemarker/core/_TemplateModelException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 730
    :cond_10
    invoke-interface {p1}, Lfreemarker/template/TemplateNodeModel;->getChildNodes()Lfreemarker/template/TemplateSequenceModel;

    move-result-object v1

    .line 731
    .local v1, "children":Lfreemarker/template/TemplateSequenceModel;
    if-nez v1, :cond_17

    .line 738
    :cond_16
    return-void

    .line 732
    :cond_17
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_18
    invoke-interface {v1}, Lfreemarker/template/TemplateSequenceModel;->size()I

    move-result v3

    if-ge v2, v3, :cond_16

    .line 733
    invoke-interface {v1, v2}, Lfreemarker/template/TemplateSequenceModel;->get(I)Lfreemarker/template/TemplateModel;

    move-result-object v0

    check-cast v0, Lfreemarker/template/TemplateNodeModel;

    .line 734
    .local v0, "child":Lfreemarker/template/TemplateNodeModel;
    if-eqz v0, :cond_29

    .line 735
    invoke-virtual {p0, v0, p2}, Lfreemarker/core/Environment;->visit(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V

    .line 732
    :cond_29
    add-int/lit8 v2, v2, 0x1

    goto :goto_18
.end method

.method renderElementToString(Lfreemarker/core/TemplateElement;)Ljava/lang/String;
    .registers 5
    .param p1, "te"    # Lfreemarker/core/TemplateElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1794
    iget-object v0, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1796
    .local v0, "prevOut":Ljava/io/Writer;
    :try_start_2
    new-instance v1, Ljava/io/StringWriter;

    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 1797
    .local v1, "sw":Ljava/io/StringWriter;
    iput-object v1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 1798
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V

    .line 1799
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;
    :try_end_f
    .catchall {:try_start_2 .. :try_end_f} :catchall_13

    move-result-object v2

    .line 1802
    iput-object v0, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    return-object v2

    .end local v1    # "sw":Ljava/io/StringWriter;
    :catchall_13
    move-exception v2

    iput-object v0, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    throw v2
.end method

.method replaceElemetStackTop(Lfreemarker/core/TemplateElement;)V
    .registers 4
    .param p1, "instr"    # Lfreemarker/core/TemplateElement;

    .prologue
    .line 1541
    iget-object v0, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    iget-object v1, p0, Lfreemarker/core/Environment;->instructionStack:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1542
    return-void
.end method

.method public setCurrentVisitorNode(Lfreemarker/template/TemplateNodeModel;)V
    .registers 2
    .param p1, "node"    # Lfreemarker/template/TemplateNodeModel;

    .prologue
    .line 1552
    iput-object p1, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    .line 1553
    return-void
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "formatName"    # Ljava/lang/String;

    .prologue
    .line 932
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setDateFormat(Ljava/lang/String;)V

    .line 933
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    .line 934
    return-void
.end method

.method public setDateTimeFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "formatName"    # Ljava/lang/String;

    .prologue
    .line 937
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setDateTimeFormat(Ljava/lang/String;)V

    .line 938
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    .line 939
    return-void
.end method

.method setFastInvalidReferenceExceptions(Z)Z
    .registers 3
    .param p1, "b"    # Z

    .prologue
    .line 1952
    iget-boolean v0, p0, Lfreemarker/core/Environment;->fastInvalidReferenceExceptions:Z

    .line 1953
    .local v0, "res":Z
    iput-boolean p1, p0, Lfreemarker/core/Environment;->fastInvalidReferenceExceptions:Z

    .line 1954
    return v0
.end method

.method public setGlobalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 1247
    iget-object v0, p0, Lfreemarker/core/Environment;->globalNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1, p2}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1248
    return-void
.end method

.method setLastReturnValue(Lfreemarker/template/TemplateModel;)V
    .registers 2
    .param p1, "lastReturnValue"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 950
    iput-object p1, p0, Lfreemarker/core/Environment;->lastReturnValue:Lfreemarker/template/TemplateModel;

    .line 951
    return-void
.end method

.method public setLocalVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 1269
    iget-object v0, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    if-nez v0, :cond_c

    .line 1270
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Not executing macro body"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1272
    :cond_c
    iget-object v0, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    invoke-virtual {v0, p1, p2}, Lfreemarker/core/Macro$Context;->setLocalVar(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 1273
    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 3
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    const/4 v0, 0x0

    .line 775
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setLocale(Ljava/util/Locale;)V

    .line 777
    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormats:Ljava/util/Map;

    .line 778
    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    .line 780
    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    .line 781
    iput-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    iput-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    .line 783
    iput-object v0, p0, Lfreemarker/core/Environment;->collator:Ljava/text/Collator;

    .line 784
    return-void
.end method

.method public setNumberFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "formatName"    # Ljava/lang/String;

    .prologue
    .line 911
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setNumberFormat(Ljava/lang/String;)V

    .line 912
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->numberFormat:Ljava/text/NumberFormat;

    .line 913
    return-void
.end method

.method public setOut(Ljava/io/Writer;)V
    .registers 2
    .param p1, "out"    # Ljava/io/Writer;

    .prologue
    .line 896
    iput-object p1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 897
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .registers 3
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 805
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/core/Environment;->urlEscapingCharsetCached:Z

    .line 806
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setOutputEncoding(Ljava/lang/String;)V

    .line 807
    return-void
.end method

.method public setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V
    .registers 3
    .param p1, "templateExceptionHandler"    # Lfreemarker/template/TemplateExceptionHandler;

    .prologue
    .line 770
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    .line 771
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->lastThrowable:Ljava/lang/Throwable;

    .line 772
    return-void
.end method

.method public setTimeFormat(Ljava/lang/String;)V
    .registers 3
    .param p1, "formatName"    # Ljava/lang/String;

    .prologue
    .line 927
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setTimeFormat(Ljava/lang/String;)V

    .line 928
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    .line 929
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .registers 3
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    const/4 v0, 0x0

    .line 787
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setTimeZone(Ljava/util/TimeZone;)V

    .line 789
    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormats:[Ljava/util/Map;

    .line 790
    iput-object v0, p0, Lfreemarker/core/Environment;->dateTimeFormat:Ljava/text/DateFormat;

    iput-object v0, p0, Lfreemarker/core/Environment;->dateFormat:Ljava/text/DateFormat;

    iput-object v0, p0, Lfreemarker/core/Environment;->timeFormat:Ljava/text/DateFormat;

    .line 791
    return-void
.end method

.method public setURLEscapingCharset(Ljava/lang/String;)V
    .registers 3
    .param p1, "urlEscapingCharset"    # Ljava/lang/String;

    .prologue
    .line 794
    const/4 v0, 0x0

    iput-boolean v0, p0, Lfreemarker/core/Environment;->urlEscapingCharsetCached:Z

    .line 795
    invoke-super {p0, p1}, Lfreemarker/core/Configurable;->setURLEscapingCharset(Ljava/lang/String;)V

    .line 796
    return-void
.end method

.method public setVariable(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "model"    # Lfreemarker/template/TemplateModel;

    .prologue
    .line 1257
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1, p2}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 1258
    return-void
.end method

.method visit(Lfreemarker/core/BodyInstruction$Context;)V
    .registers 8
    .param p1, "bctxt"    # Lfreemarker/core/BodyInstruction$Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 474
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getCurrentMacroContext()Lfreemarker/core/Macro$Context;

    move-result-object v1

    .line 475
    .local v1, "invokingMacroContext":Lfreemarker/core/Macro$Context;
    iget-object v2, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 476
    .local v2, "prevLocalContextStack":Ljava/util/ArrayList;
    iget-object v0, v1, Lfreemarker/core/Macro$Context;->body:Lfreemarker/core/TemplateElement;

    .line 477
    .local v0, "body":Lfreemarker/core/TemplateElement;
    if-eqz v0, :cond_45

    .line 478
    iget-object v4, v1, Lfreemarker/core/Macro$Context;->prevMacroContext:Lfreemarker/core/Macro$Context;

    iput-object v4, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 479
    iget-object v4, v1, Lfreemarker/core/Macro$Context;->bodyNamespace:Lfreemarker/core/Environment$Namespace;

    iput-object v4, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 480
    invoke-virtual {p0}, Lfreemarker/core/Environment;->getParent()Lfreemarker/core/Configurable;

    move-result-object v3

    .line 481
    .local v3, "prevParent":Lfreemarker/core/Configurable;
    iget-object v4, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v4}, Lfreemarker/core/Environment$Namespace;->getTemplate()Lfreemarker/template/Template;

    move-result-object v4

    invoke-virtual {p0, v4}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    .line 482
    iget-object v4, v1, Lfreemarker/core/Macro$Context;->prevLocalContextStack:Ljava/util/ArrayList;

    iput-object v4, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 483
    iget-object v4, v1, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    if-eqz v4, :cond_2a

    .line 484
    invoke-direct {p0, p1}, Lfreemarker/core/Environment;->pushLocalContext(Lfreemarker/core/LocalContext;)V

    .line 487
    :cond_2a
    :try_start_2a
    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_46

    .line 490
    iget-object v4, v1, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    if-eqz v4, :cond_34

    .line 491
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    .line 493
    :cond_34
    iput-object v1, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 494
    invoke-virtual {v1}, Lfreemarker/core/Macro$Context;->getMacro()Lfreemarker/core/Macro;

    move-result-object v4

    invoke-virtual {p0, v4}, Lfreemarker/core/Environment;->getMacroNamespace(Lfreemarker/core/Macro;)Lfreemarker/core/Environment$Namespace;

    move-result-object v4

    iput-object v4, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 495
    invoke-virtual {p0, v3}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    .line 496
    iput-object v2, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 499
    .end local v3    # "prevParent":Lfreemarker/core/Configurable;
    :cond_45
    return-void

    .line 490
    .restart local v3    # "prevParent":Lfreemarker/core/Configurable;
    :catchall_46
    move-exception v4

    iget-object v5, v1, Lfreemarker/core/Macro$Context;->bodyParameterNames:Ljava/util/List;

    if-eqz v5, :cond_4e

    .line 491
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    .line 493
    :cond_4e
    iput-object v1, p0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 494
    invoke-virtual {v1}, Lfreemarker/core/Macro$Context;->getMacro()Lfreemarker/core/Macro;

    move-result-object v5

    invoke-virtual {p0, v5}, Lfreemarker/core/Environment;->getMacroNamespace(Lfreemarker/core/Macro;)Lfreemarker/core/Environment$Namespace;

    move-result-object v5

    iput-object v5, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 495
    invoke-virtual {p0, v3}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    .line 496
    iput-object v2, p0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    throw v4
.end method

.method visit(Lfreemarker/core/Macro;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lfreemarker/core/TemplateElement;)V
    .registers 36
    .param p1, "macro"    # Lfreemarker/core/Macro;
    .param p2, "namedArgs"    # Ljava/util/Map;
    .param p3, "positionalArgs"    # Ljava/util/List;
    .param p4, "bodyParameterNames"    # Ljava/util/List;
    .param p5, "nestedBlock"    # Lfreemarker/core/TemplateElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 626
    sget-object v25, Lfreemarker/core/Macro;->DO_NOTHING_MACRO:Lfreemarker/core/Macro;

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    if-ne v0, v1, :cond_9

    .line 709
    :goto_8
    return-void

    .line 629
    :cond_9
    invoke-direct/range {p0 .. p1}, Lfreemarker/core/Environment;->pushElement(Lfreemarker/core/TemplateElement;)V

    .line 631
    :try_start_c
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    move-object/from16 v18, v0

    .line 632
    .local v18, "previousMacroContext":Lfreemarker/core/Macro$Context;
    new-instance v14, Lfreemarker/core/Macro$Context;

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p5

    move-object/from16 v3, p4

    invoke-direct {v14, v0, v1, v2, v3}, Lfreemarker/core/Macro$Context;-><init>(Lfreemarker/core/Macro;Lfreemarker/core/Environment;Lfreemarker/core/TemplateElement;Ljava/util/List;)V

    .line 634
    .local v14, "mc":Lfreemarker/core/Macro$Context;
    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Macro;->getCatchAll()Ljava/lang/String;

    move-result-object v9

    .line 635
    .local v9, "catchAll":Ljava/lang/String;
    const/16 v22, 0x0

    .line 637
    .local v22, "unknownVars":Lfreemarker/template/TemplateModel;
    if-eqz p2, :cond_b3

    .line 638
    if-eqz v9, :cond_31

    .line 639
    new-instance v22, Lfreemarker/template/SimpleHash;

    .end local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    invoke-direct/range {v22 .. v22}, Lfreemarker/template/SimpleHash;-><init>()V

    .line 640
    .restart local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    :cond_31
    invoke-interface/range {p2 .. p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v25

    invoke-interface/range {v25 .. v25}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .local v13, "it":Ljava/util/Iterator;
    :goto_39
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v25

    if-eqz v25, :cond_150

    .line 641
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/Map$Entry;

    .line 642
    .local v10, "entry":Ljava/util/Map$Entry;
    invoke-interface {v10}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v24

    check-cast v24, Ljava/lang/String;

    .line 643
    .local v24, "varName":Ljava/lang/String;
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lfreemarker/core/Macro;->hasArgNamed(Ljava/lang/String;)Z

    move-result v11

    .line 644
    .local v11, "hasVar":Z
    if-nez v11, :cond_57

    if-eqz v9, :cond_82

    .line 645
    :cond_57
    invoke-interface {v10}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lfreemarker/core/Expression;

    .line 646
    .local v4, "arg":Lfreemarker/core/Expression;
    move-object/from16 v0, p0

    invoke-virtual {v4, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;

    move-result-object v23

    .line 647
    .local v23, "value":Lfreemarker/template/TemplateModel;
    if-eqz v11, :cond_72

    .line 648
    move-object/from16 v0, v24

    move-object/from16 v1, v23

    invoke-virtual {v14, v0, v1}, Lfreemarker/core/Macro$Context;->setLocalVar(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V
    :try_end_6c
    .catchall {:try_start_c .. :try_end_6c} :catchall_6d

    goto :goto_39

    .line 707
    .end local v4    # "arg":Lfreemarker/core/Expression;
    .end local v9    # "catchAll":Ljava/lang/String;
    .end local v10    # "entry":Ljava/util/Map$Entry;
    .end local v11    # "hasVar":Z
    .end local v13    # "it":Ljava/util/Iterator;
    .end local v14    # "mc":Lfreemarker/core/Macro$Context;
    .end local v18    # "previousMacroContext":Lfreemarker/core/Macro$Context;
    .end local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    .end local v23    # "value":Lfreemarker/template/TemplateModel;
    .end local v24    # "varName":Ljava/lang/String;
    :catchall_6d
    move-exception v25

    invoke-direct/range {p0 .. p0}, Lfreemarker/core/Environment;->popElement()V

    throw v25

    .line 650
    .restart local v4    # "arg":Lfreemarker/core/Expression;
    .restart local v9    # "catchAll":Ljava/lang/String;
    .restart local v10    # "entry":Ljava/util/Map$Entry;
    .restart local v11    # "hasVar":Z
    .restart local v13    # "it":Ljava/util/Iterator;
    .restart local v14    # "mc":Lfreemarker/core/Macro$Context;
    .restart local v18    # "previousMacroContext":Lfreemarker/core/Macro$Context;
    .restart local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    .restart local v23    # "value":Lfreemarker/template/TemplateModel;
    .restart local v24    # "varName":Ljava/lang/String;
    :cond_72
    :try_start_72
    move-object/from16 v0, v22

    check-cast v0, Lfreemarker/template/SimpleHash;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, v24

    move-object/from16 v2, v23

    invoke-virtual {v0, v1, v2}, Lfreemarker/template/SimpleHash;->put(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_39

    .line 653
    .end local v4    # "arg":Lfreemarker/core/Expression;
    .end local v23    # "value":Lfreemarker/template/TemplateModel;
    :cond_82
    new-instance v25, Lfreemarker/core/_MiscTemplateException;

    const/16 v26, 0x4

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    const-string v28, "Macro "

    aput-object v28, v26, v27

    const/16 v27, 0x1

    new-instance v28, Lfreemarker/core/_DelayedJQuote;

    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-direct/range {v28 .. v29}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v28, v26, v27

    const/16 v27, 0x2

    const-string v28, " has no such argument: "

    aput-object v28, v26, v27

    const/16 v27, 0x3

    aput-object v24, v26, v27

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v25

    .line 659
    .end local v10    # "entry":Ljava/util/Map$Entry;
    .end local v11    # "hasVar":Z
    .end local v13    # "it":Ljava/util/Iterator;
    .end local v24    # "varName":Ljava/lang/String;
    :cond_b3
    if-eqz p3, :cond_150

    .line 660
    if-eqz v9, :cond_bc

    .line 661
    new-instance v22, Lfreemarker/template/SimpleSequence;

    .end local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    invoke-direct/range {v22 .. v22}, Lfreemarker/template/SimpleSequence;-><init>()V

    .line 662
    .restart local v22    # "unknownVars":Lfreemarker/template/TemplateModel;
    :cond_bc
    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Macro;->getArgumentNamesInternal()[Ljava/lang/String;

    move-result-object v8

    .line 663
    .local v8, "argumentNames":[Ljava/lang/String;
    invoke-interface/range {p3 .. p3}, Ljava/util/List;->size()I

    move-result v20

    .line 664
    .local v20, "size":I
    array-length v0, v8

    move/from16 v25, v0

    move/from16 v0, v25

    move/from16 v1, v20

    if-ge v0, v1, :cond_115

    if-nez v9, :cond_115

    .line 665
    new-instance v25, Lfreemarker/core/_MiscTemplateException;

    const/16 v26, 0x1

    move/from16 v0, v26

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v26, v0

    const/16 v27, 0x0

    new-instance v28, Ljava/lang/StringBuffer;

    invoke-direct/range {v28 .. v28}, Ljava/lang/StringBuffer;-><init>()V

    const-string v29, "Macro "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    invoke-virtual/range {p1 .. p1}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v29

    invoke-static/range {v29 .. v29}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    const-string v29, " only accepts "

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    array-length v0, v8

    move/from16 v29, v0

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v28

    const-string v29, " parameters."

    invoke-virtual/range {v28 .. v29}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v28

    invoke-virtual/range {v28 .. v28}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v28

    aput-object v28, v26, v27

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    move-object/from16 v2, v26

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v25

    .line 669
    :cond_115
    const/4 v12, 0x0

    .local v12, "i":I
    :goto_116
    move/from16 v0, v20

    if-ge v12, v0, :cond_150

    .line 670
    move-object/from16 v0, p3

    invoke-interface {v0, v12}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lfreemarker/core/Expression;

    .line 671
    .local v5, "argExp":Lfreemarker/core/Expression;
    move-object/from16 v0, p0

    invoke-virtual {v5, v0}, Lfreemarker/core/Expression;->eval(Lfreemarker/core/Environment;)Lfreemarker/template/TemplateModel;
    :try_end_127
    .catchall {:try_start_72 .. :try_end_127} :catchall_6d

    move-result-object v6

    .line 673
    .local v6, "argModel":Lfreemarker/template/TemplateModel;
    :try_start_128
    array-length v0, v8

    move/from16 v25, v0

    move/from16 v0, v25

    if-ge v12, v0, :cond_137

    .line 674
    aget-object v7, v8, v12

    .line 675
    .local v7, "argName":Ljava/lang/String;
    invoke-virtual {v14, v7, v6}, Lfreemarker/core/Macro$Context;->setLocalVar(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 669
    .end local v7    # "argName":Ljava/lang/String;
    :goto_134
    add-int/lit8 v12, v12, 0x1

    goto :goto_116

    .line 677
    :cond_137
    move-object/from16 v0, v22

    check-cast v0, Lfreemarker/template/SimpleSequence;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    invoke-virtual {v0, v6}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V
    :try_end_142
    .catch Ljava/lang/RuntimeException; {:try_start_128 .. :try_end_142} :catch_143
    .catchall {:try_start_128 .. :try_end_142} :catchall_6d

    goto :goto_134

    .line 679
    :catch_143
    move-exception v19

    .line 680
    .local v19, "re":Ljava/lang/RuntimeException;
    :try_start_144
    new-instance v25, Lfreemarker/core/_MiscTemplateException;

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    move-object/from16 v2, p0

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;)V

    throw v25

    .line 684
    .end local v5    # "argExp":Lfreemarker/core/Expression;
    .end local v6    # "argModel":Lfreemarker/template/TemplateModel;
    .end local v8    # "argumentNames":[Ljava/lang/String;
    .end local v12    # "i":I
    .end local v19    # "re":Ljava/lang/RuntimeException;
    .end local v20    # "size":I
    :cond_150
    if-eqz v9, :cond_157

    .line 685
    move-object/from16 v0, v22

    invoke-virtual {v14, v9, v0}, Lfreemarker/core/Macro$Context;->setLocalVar(Ljava/lang/String;Lfreemarker/template/TemplateModel;)V

    .line 687
    :cond_157
    move-object/from16 v0, p0

    iget-object v15, v0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 688
    .local v15, "prevLocalContextStack":Ljava/util/ArrayList;
    const/16 v25, 0x0

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 689
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    move-object/from16 v16, v0

    .line 690
    .local v16, "prevNamespace":Lfreemarker/core/Environment$Namespace;
    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/Environment;->getParent()Lfreemarker/core/Configurable;

    move-result-object v17

    .line 691
    .local v17, "prevParent":Lfreemarker/core/Configurable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lfreemarker/core/Environment;->macroToNamespaceLookup:Ljava/util/HashMap;

    move-object/from16 v25, v0

    move-object/from16 v0, v25

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    check-cast v25, Lfreemarker/core/Environment$Namespace;

    move-object/from16 v0, v25

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 692
    move-object/from16 v0, p0

    iput-object v14, v0, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;
    :try_end_187
    .catchall {:try_start_144 .. :try_end_187} :catchall_6d

    .line 694
    :try_start_187
    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Lfreemarker/core/Macro$Context;->runMacro(Lfreemarker/core/Environment;)V
    :try_end_18c
    .catch Lfreemarker/core/ReturnInstruction$Return; {:try_start_187 .. :try_end_18c} :catch_1a8
    .catch Lfreemarker/template/TemplateException; {:try_start_187 .. :try_end_18c} :catch_1c1
    .catchall {:try_start_187 .. :try_end_18c} :catchall_1e1

    .line 701
    :try_start_18c
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 702
    move-object/from16 v0, p0

    iput-object v15, v0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 703
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 704
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V
    :try_end_1a3
    .catchall {:try_start_18c .. :try_end_1a3} :catchall_6d

    .line 707
    :goto_1a3
    invoke-direct/range {p0 .. p0}, Lfreemarker/core/Environment;->popElement()V

    goto/16 :goto_8

    .line 696
    :catch_1a8
    move-exception v25

    .line 701
    :try_start_1a9
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 702
    move-object/from16 v0, p0

    iput-object v15, v0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 703
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 704
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V
    :try_end_1c0
    .catchall {:try_start_1a9 .. :try_end_1c0} :catchall_6d

    goto :goto_1a3

    .line 698
    :catch_1c1
    move-exception v21

    .line 699
    .local v21, "te":Lfreemarker/template/TemplateException;
    :try_start_1c2
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v1}, Lfreemarker/core/Environment;->handleTemplateException(Lfreemarker/template/TemplateException;)V
    :try_end_1c9
    .catchall {:try_start_1c2 .. :try_end_1c9} :catchall_1e1

    .line 701
    :try_start_1c9
    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 702
    move-object/from16 v0, p0

    iput-object v15, v0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 703
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 704
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    goto :goto_1a3

    .line 701
    .end local v21    # "te":Lfreemarker/template/TemplateException;
    :catchall_1e1
    move-exception v25

    move-object/from16 v0, v18

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentMacroContext:Lfreemarker/core/Macro$Context;

    .line 702
    move-object/from16 v0, p0

    iput-object v15, v0, Lfreemarker/core/Environment;->localContextStack:Ljava/util/ArrayList;

    .line 703
    move-object/from16 v0, v16

    move-object/from16 v1, p0

    iput-object v0, v1, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    .line 704
    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lfreemarker/core/Environment;->setParent(Lfreemarker/core/Configurable;)V

    throw v25
    :try_end_1fa
    .catchall {:try_start_1c9 .. :try_end_1fa} :catchall_6d
.end method

.method visit(Lfreemarker/core/TemplateElement;)V
    .registers 4
    .param p1, "element"    # Lfreemarker/core/TemplateElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 263
    invoke-direct {p0, p1}, Lfreemarker/core/Environment;->pushElement(Lfreemarker/core/TemplateElement;)V

    .line 265
    :try_start_3
    invoke-virtual {p1, p0}, Lfreemarker/core/TemplateElement;->accept(Lfreemarker/core/Environment;)V
    :try_end_6
    .catch Lfreemarker/template/TemplateException; {:try_start_3 .. :try_end_6} :catch_a
    .catchall {:try_start_3 .. :try_end_6} :catchall_12

    .line 271
    invoke-direct {p0}, Lfreemarker/core/Environment;->popElement()V

    .line 273
    :goto_9
    return-void

    .line 267
    :catch_a
    move-exception v0

    .line 268
    .local v0, "te":Lfreemarker/template/TemplateException;
    :try_start_b
    invoke-direct {p0, v0}, Lfreemarker/core/Environment;->handleTemplateException(Lfreemarker/template/TemplateException;)V
    :try_end_e
    .catchall {:try_start_b .. :try_end_e} :catchall_12

    .line 271
    invoke-direct {p0}, Lfreemarker/core/Environment;->popElement()V

    goto :goto_9

    .end local v0    # "te":Lfreemarker/template/TemplateException;
    :catchall_12
    move-exception v1

    invoke-direct {p0}, Lfreemarker/core/Environment;->popElement()V

    throw v1
.end method

.method public visit(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateDirectiveModel;Ljava/util/Map;Ljava/util/List;)V
    .registers 9
    .param p1, "element"    # Lfreemarker/core/TemplateElement;
    .param p2, "directiveModel"    # Lfreemarker/template/TemplateDirectiveModel;
    .param p3, "args"    # Ljava/util/Map;
    .param p4, "bodyParameterNames"    # Ljava/util/List;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 304
    if-nez p1, :cond_22

    .line 305
    const/4 v0, 0x0

    .line 322
    .local v0, "nested":Lfreemarker/template/TemplateDirectiveBody;
    :goto_3
    if-eqz p4, :cond_b

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_28

    .line 323
    :cond_b
    sget-object v1, Lfreemarker/core/Environment;->NO_OUT_ARGS:[Lfreemarker/template/TemplateModel;

    .line 328
    .local v1, "outArgs":[Lfreemarker/template/TemplateModel;
    :goto_d
    array-length v2, v1

    if-lez v2, :cond_18

    .line 329
    new-instance v2, Lfreemarker/core/Environment$2;

    invoke-direct {v2, p0, p4, v1}, Lfreemarker/core/Environment$2;-><init>(Lfreemarker/core/Environment;Ljava/util/List;[Lfreemarker/template/TemplateModel;)V

    invoke-direct {p0, v2}, Lfreemarker/core/Environment;->pushLocalContext(Lfreemarker/core/LocalContext;)V

    .line 341
    :cond_18
    :try_start_18
    invoke-interface {p2, p0, p3, v1, v0}, Lfreemarker/template/TemplateDirectiveModel;->execute(Lfreemarker/core/Environment;Ljava/util/Map;[Lfreemarker/template/TemplateModel;Lfreemarker/template/TemplateDirectiveBody;)V
    :try_end_1b
    .catchall {:try_start_18 .. :try_end_1b} :catchall_2f

    .line 344
    array-length v2, v1

    if-lez v2, :cond_21

    .line 345
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    .line 348
    :cond_21
    return-void

    .line 308
    .end local v0    # "nested":Lfreemarker/template/TemplateDirectiveBody;
    .end local v1    # "outArgs":[Lfreemarker/template/TemplateModel;
    :cond_22
    new-instance v0, Lfreemarker/core/Environment$1;

    invoke-direct {v0, p0, p1}, Lfreemarker/core/Environment$1;-><init>(Lfreemarker/core/Environment;Lfreemarker/core/TemplateElement;)V

    .restart local v0    # "nested":Lfreemarker/template/TemplateDirectiveBody;
    goto :goto_3

    .line 326
    :cond_28
    invoke-interface {p4}, Ljava/util/List;->size()I

    move-result v2

    new-array v1, v2, [Lfreemarker/template/TemplateModel;

    .restart local v1    # "outArgs":[Lfreemarker/template/TemplateModel;
    goto :goto_d

    .line 344
    :catchall_2f
    move-exception v2

    array-length v3, v1

    if-lez v3, :cond_36

    .line 345
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    :cond_36
    throw v2
.end method

.method visit(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V
    .registers 18
    .param p1, "node"    # Lfreemarker/template/TemplateNodeModel;
    .param p2, "namespaces"    # Lfreemarker/template/TemplateSequenceModel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 528
    iget-object v1, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    if-nez v1, :cond_11

    .line 529
    new-instance v14, Lfreemarker/template/SimpleSequence;

    const/4 v1, 0x1

    invoke-direct {v14, v1}, Lfreemarker/template/SimpleSequence;-><init>(I)V

    .line 530
    .local v14, "ss":Lfreemarker/template/SimpleSequence;
    iget-object v1, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v14, v1}, Lfreemarker/template/SimpleSequence;->add(Ljava/lang/Object;)V

    .line 531
    iput-object v14, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    .line 533
    .end local v14    # "ss":Lfreemarker/template/SimpleSequence;
    :cond_11
    iget v11, p0, Lfreemarker/core/Environment;->nodeNamespaceIndex:I

    .line 534
    .local v11, "prevNodeNamespaceIndex":I
    iget-object v10, p0, Lfreemarker/core/Environment;->currentNodeName:Ljava/lang/String;

    .line 535
    .local v10, "prevNodeName":Ljava/lang/String;
    iget-object v9, p0, Lfreemarker/core/Environment;->currentNodeNS:Ljava/lang/String;

    .line 536
    .local v9, "prevNodeNS":Ljava/lang/String;
    iget-object v12, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    .line 537
    .local v12, "prevNodeNamespaces":Lfreemarker/template/TemplateSequenceModel;
    iget-object v13, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    .line 538
    .local v13, "prevVisitorNode":Lfreemarker/template/TemplateNodeModel;
    move-object/from16 v0, p1

    iput-object v0, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    .line 539
    if-eqz p2, :cond_25

    .line 540
    move-object/from16 v0, p2

    iput-object v0, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    .line 543
    :cond_25
    :try_start_25
    invoke-virtual/range {p0 .. p1}, Lfreemarker/core/Environment;->getNodeProcessor(Lfreemarker/template/TemplateNodeModel;)Lfreemarker/template/TemplateModel;

    move-result-object v7

    .line 544
    .local v7, "macroOrTransform":Lfreemarker/template/TemplateModel;
    instance-of v1, v7, Lfreemarker/core/Macro;

    if-eqz v1, :cond_44

    .line 545
    move-object v0, v7

    check-cast v0, Lfreemarker/core/Macro;

    move-object v2, v0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/Macro;Ljava/util/Map;Ljava/util/List;Ljava/util/List;Lfreemarker/core/TemplateElement;)V
    :try_end_39
    .catchall {:try_start_25 .. :try_end_39} :catchall_50

    .line 578
    .end local v7    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    .end local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    :cond_39
    :goto_39
    iput-object v13, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    .line 579
    iput v11, p0, Lfreemarker/core/Environment;->nodeNamespaceIndex:I

    .line 580
    iput-object v10, p0, Lfreemarker/core/Environment;->currentNodeName:Ljava/lang/String;

    .line 581
    iput-object v9, p0, Lfreemarker/core/Environment;->currentNodeNS:Ljava/lang/String;

    .line 582
    iput-object v12, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    .line 584
    return-void

    .line 547
    .restart local v7    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    .restart local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    :cond_44
    :try_start_44
    instance-of v1, v7, Lfreemarker/template/TemplateTransformModel;

    if-eqz v1, :cond_5c

    .line 548
    const/4 v1, 0x0

    check-cast v7, Lfreemarker/template/TemplateTransformModel;

    .end local v7    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    const/4 v2, 0x0

    invoke-virtual {p0, v1, v7, v2}, Lfreemarker/core/Environment;->visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V
    :try_end_4f
    .catchall {:try_start_44 .. :try_end_4f} :catchall_50

    goto :goto_39

    .line 578
    .end local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    :catchall_50
    move-exception v1

    iput-object v13, p0, Lfreemarker/core/Environment;->currentVisitorNode:Lfreemarker/template/TemplateNodeModel;

    .line 579
    iput v11, p0, Lfreemarker/core/Environment;->nodeNamespaceIndex:I

    .line 580
    iput-object v10, p0, Lfreemarker/core/Environment;->currentNodeName:Ljava/lang/String;

    .line 581
    iput-object v9, p0, Lfreemarker/core/Environment;->currentNodeNS:Ljava/lang/String;

    .line 582
    iput-object v12, p0, Lfreemarker/core/Environment;->nodeNamespaces:Lfreemarker/template/TemplateSequenceModel;

    throw v1

    .line 551
    .restart local v7    # "macroOrTransform":Lfreemarker/template/TemplateModel;
    .restart local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    :cond_5c
    :try_start_5c
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateNodeModel;->getNodeType()Ljava/lang/String;

    move-result-object v8

    .line 552
    .local v8, "nodeType":Ljava/lang/String;
    if-eqz v8, :cond_b0

    .line 554
    const-string v1, "text"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7c

    move-object/from16 v0, p1

    instance-of v1, v0, Lfreemarker/template/TemplateScalarModel;

    if-eqz v1, :cond_7c

    .line 556
    iget-object v1, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    check-cast p1, Lfreemarker/template/TemplateScalarModel;

    .end local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateScalarModel;->getAsString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_39

    .line 558
    .restart local p1    # "node":Lfreemarker/template/TemplateNodeModel;
    :cond_7c
    const-string v1, "document"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_88

    .line 559
    invoke-virtual/range {p0 .. p2}, Lfreemarker/core/Environment;->recurse(Lfreemarker/template/TemplateNodeModel;Lfreemarker/template/TemplateSequenceModel;)V

    goto :goto_39

    .line 563
    :cond_88
    const-string v1, "pi"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    const-string v1, "comment"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    const-string v1, "document_type"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_39

    .line 567
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateNodeModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v2, v8}, Lfreemarker/core/Environment;->noNodeHandlerDefinedDescription(Lfreemarker/template/TemplateNodeModel;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v1

    .line 572
    :cond_b0
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-interface/range {p1 .. p1}, Lfreemarker/template/TemplateNodeModel;->getNodeNamespace()Ljava/lang/String;

    move-result-object v2

    const-string v3, "default"

    move-object/from16 v0, p1

    invoke-direct {p0, v0, v2, v3}, Lfreemarker/core/Environment;->noNodeHandlerDefinedDescription(Lfreemarker/template/TemplateNodeModel;Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v1
    :try_end_c2
    .catchall {:try_start_5c .. :try_end_c2} :catchall_50
.end method

.method visitAndTransform(Lfreemarker/core/TemplateElement;Lfreemarker/template/TemplateTransformModel;Ljava/util/Map;)V
    .registers 12
    .param p1, "element"    # Lfreemarker/core/TemplateElement;
    .param p2, "transform"    # Lfreemarker/template/TemplateTransformModel;
    .param p3, "args"    # Ljava/util/Map;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 364
    :try_start_0
    iget-object v7, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    invoke-interface {p2, v7, p3}, Lfreemarker/template/TemplateTransformModel;->getWriter(Ljava/io/Writer;Ljava/util/Map;)Ljava/io/Writer;

    move-result-object v6

    .line 365
    .local v6, "tw":Ljava/io/Writer;
    if-nez v6, :cond_a

    sget-object v6, Lfreemarker/core/Environment;->EMPTY_BODY_WRITER:Ljava/io/Writer;

    .line 366
    :cond_a
    instance-of v7, v6, Lfreemarker/template/TransformControl;

    if-eqz v7, :cond_32

    move-object v0, v6

    check-cast v0, Lfreemarker/template/TransformControl;

    move-object v7, v0

    move-object v4, v7

    .line 371
    .local v4, "tc":Lfreemarker/template/TransformControl;
    :goto_13
    iget-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 372
    .local v2, "prevOut":Ljava/io/Writer;
    iput-object v6, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;
    :try_end_17
    .catch Lfreemarker/template/TemplateException; {:try_start_0 .. :try_end_17} :catch_40

    .line 374
    if-eqz v4, :cond_1f

    :try_start_19
    invoke-interface {v4}, Lfreemarker/template/TransformControl;->onStart()I

    move-result v7

    if-eqz v7, :cond_2c

    .line 376
    :cond_1f
    if-eqz p1, :cond_24

    .line 377
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V

    .line 379
    :cond_24
    if-eqz v4, :cond_2c

    invoke-interface {v4}, Lfreemarker/template/TransformControl;->afterBody()I
    :try_end_29
    .catch Ljava/lang/Throwable; {:try_start_19 .. :try_end_29} :catch_34
    .catchall {:try_start_19 .. :try_end_29} :catchall_48

    move-result v7

    if-eqz v7, :cond_1f

    .line 408
    :cond_2c
    :try_start_2c
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 409
    invoke-virtual {v6}, Ljava/io/Writer;->close()V
    :try_end_31
    .catch Lfreemarker/template/TemplateException; {:try_start_2c .. :try_end_31} :catch_40

    .line 415
    .end local v2    # "prevOut":Ljava/io/Writer;
    .end local v4    # "tc":Lfreemarker/template/TransformControl;
    .end local v6    # "tw":Ljava/io/Writer;
    :goto_31
    return-void

    .line 366
    .restart local v6    # "tw":Ljava/io/Writer;
    :cond_32
    const/4 v4, 0x0

    goto :goto_13

    .line 382
    .restart local v2    # "prevOut":Ljava/io/Writer;
    .restart local v4    # "tc":Lfreemarker/template/TransformControl;
    :catch_34
    move-exception v3

    .line 384
    .local v3, "t":Ljava/lang/Throwable;
    if-eqz v4, :cond_45

    .line 385
    :try_start_37
    invoke-interface {v4, v3}, Lfreemarker/template/TransformControl;->onError(Ljava/lang/Throwable;)V
    :try_end_3a
    .catch Lfreemarker/template/TemplateException; {:try_start_37 .. :try_end_3a} :catch_46
    .catch Ljava/io/IOException; {:try_start_37 .. :try_end_3a} :catch_4f
    .catch Ljava/lang/RuntimeException; {:try_start_37 .. :try_end_3a} :catch_51
    .catch Ljava/lang/Error; {:try_start_37 .. :try_end_3a} :catch_53
    .catch Ljava/lang/Throwable; {:try_start_37 .. :try_end_3a} :catch_55
    .catchall {:try_start_37 .. :try_end_3a} :catchall_48

    .line 408
    :try_start_3a
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 409
    invoke-virtual {v6}, Ljava/io/Writer;->close()V
    :try_end_3f
    .catch Lfreemarker/template/TemplateException; {:try_start_3a .. :try_end_3f} :catch_40

    goto :goto_31

    .line 412
    .end local v2    # "prevOut":Ljava/io/Writer;
    .end local v3    # "t":Ljava/lang/Throwable;
    .end local v4    # "tc":Lfreemarker/template/TransformControl;
    .end local v6    # "tw":Ljava/io/Writer;
    :catch_40
    move-exception v5

    .line 413
    .local v5, "te":Lfreemarker/template/TemplateException;
    invoke-direct {p0, v5}, Lfreemarker/core/Environment;->handleTemplateException(Lfreemarker/template/TemplateException;)V

    goto :goto_31

    .line 388
    .end local v5    # "te":Lfreemarker/template/TemplateException;
    .restart local v2    # "prevOut":Ljava/io/Writer;
    .restart local v3    # "t":Ljava/lang/Throwable;
    .restart local v4    # "tc":Lfreemarker/template/TransformControl;
    .restart local v6    # "tw":Ljava/io/Writer;
    :cond_45
    :try_start_45
    throw v3
    :try_end_46
    .catch Lfreemarker/template/TemplateException; {:try_start_45 .. :try_end_46} :catch_46
    .catch Ljava/io/IOException; {:try_start_45 .. :try_end_46} :catch_4f
    .catch Ljava/lang/RuntimeException; {:try_start_45 .. :try_end_46} :catch_51
    .catch Ljava/lang/Error; {:try_start_45 .. :try_end_46} :catch_53
    .catch Ljava/lang/Throwable; {:try_start_45 .. :try_end_46} :catch_55
    .catchall {:try_start_45 .. :try_end_46} :catchall_48

    .line 391
    :catch_46
    move-exception v1

    .line 392
    .local v1, "e":Lfreemarker/template/TemplateException;
    :try_start_47
    throw v1
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_48

    .line 408
    .end local v1    # "e":Lfreemarker/template/TemplateException;
    .end local v3    # "t":Ljava/lang/Throwable;
    :catchall_48
    move-exception v7

    :try_start_49
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 409
    invoke-virtual {v6}, Ljava/io/Writer;->close()V

    throw v7
    :try_end_4f
    .catch Lfreemarker/template/TemplateException; {:try_start_49 .. :try_end_4f} :catch_40

    .line 394
    .restart local v3    # "t":Ljava/lang/Throwable;
    :catch_4f
    move-exception v1

    .line 395
    .local v1, "e":Ljava/io/IOException;
    :try_start_50
    throw v1

    .line 397
    .end local v1    # "e":Ljava/io/IOException;
    :catch_51
    move-exception v1

    .line 398
    .local v1, "e":Ljava/lang/RuntimeException;
    throw v1

    .line 400
    .end local v1    # "e":Ljava/lang/RuntimeException;
    :catch_53
    move-exception v1

    .line 401
    .local v1, "e":Ljava/lang/Error;
    throw v1

    .line 403
    .end local v1    # "e":Ljava/lang/Error;
    :catch_55
    move-exception v1

    .line 404
    .local v1, "e":Ljava/lang/Throwable;
    new-instance v7, Lfreemarker/template/utility/UndeclaredThrowableException;

    invoke-direct {v7, v1}, Lfreemarker/template/utility/UndeclaredThrowableException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_5c
    .catchall {:try_start_50 .. :try_end_5c} :catchall_48
.end method

.method visitAttemptRecover(Lfreemarker/core/TemplateElement;Lfreemarker/core/RecoveryBlock;)V
    .registers 12
    .param p1, "attemptBlock"    # Lfreemarker/core/TemplateElement;
    .param p2, "recoveryBlock"    # Lfreemarker/core/RecoveryBlock;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 422
    iget-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 423
    .local v2, "prevOut":Ljava/io/Writer;
    new-instance v3, Ljava/io/StringWriter;

    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 424
    .local v3, "sw":Ljava/io/StringWriter;
    iput-object v3, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 425
    const/4 v5, 0x0

    .line 426
    .local v5, "thrownException":Lfreemarker/template/TemplateException;
    const/4 v6, 0x0

    invoke-virtual {p0, v6}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    move-result v0

    .line 427
    .local v0, "lastFIRE":Z
    iget-boolean v1, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    .line 429
    .local v1, "lastInAttemptBlock":Z
    const/4 v6, 0x1

    :try_start_12
    iput-boolean v6, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    .line 430
    invoke-virtual {p0, p1}, Lfreemarker/core/Environment;->visitByHiddingParent(Lfreemarker/core/TemplateElement;)V
    :try_end_17
    .catch Lfreemarker/template/TemplateException; {:try_start_12 .. :try_end_17} :catch_5a
    .catchall {:try_start_12 .. :try_end_17} :catchall_64

    .line 434
    iput-boolean v1, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    .line 435
    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 436
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    .line 438
    :goto_1e
    if-eqz v5, :cond_7c

    .line 439
    sget-object v6, Lfreemarker/core/Environment;->attemptLogger:Lfreemarker/log/Logger;

    invoke-virtual {v6}, Lfreemarker/log/Logger;->isDebugEnabled()Z

    move-result v6

    if-eqz v6, :cond_44

    .line 440
    sget-object v6, Lfreemarker/core/Environment;->attemptLogger:Lfreemarker/log/Logger;

    new-instance v7, Ljava/lang/StringBuffer;

    invoke-direct {v7}, Ljava/lang/StringBuffer;-><init>()V

    const-string v8, "Error in attempt block "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {p1}, Lfreemarker/core/TemplateElement;->getStartLocationQuoted()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7, v5}, Lfreemarker/log/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 444
    :cond_44
    :try_start_44
    iget-object v6, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 445
    invoke-virtual {p0, p2}, Lfreemarker/core/Environment;->visit(Lfreemarker/core/TemplateElement;)V
    :try_end_4c
    .catchall {:try_start_44 .. :try_end_4c} :catchall_6d

    .line 447
    iget-object v6, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    iget-object v7, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 452
    :goto_59
    return-void

    .line 431
    :catch_5a
    move-exception v4

    .line 432
    .local v4, "te":Lfreemarker/template/TemplateException;
    move-object v5, v4

    .line 434
    iput-boolean v1, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    .line 435
    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 436
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    goto :goto_1e

    .line 434
    .end local v4    # "te":Lfreemarker/template/TemplateException;
    :catchall_64
    move-exception v6

    iput-boolean v1, p0, Lfreemarker/core/Environment;->inAttemptBlock:Z

    .line 435
    invoke-virtual {p0, v0}, Lfreemarker/core/Environment;->setFastInvalidReferenceExceptions(Z)Z

    .line 436
    iput-object v2, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    throw v6

    .line 447
    :catchall_6d
    move-exception v6

    iget-object v7, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    iget-object v8, p0, Lfreemarker/core/Environment;->recoveredErrorStack:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    throw v6

    .line 450
    :cond_7c
    iget-object v6, p0, Lfreemarker/core/Environment;->out:Ljava/io/Writer;

    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_59
.end method

.method visitByHiddingParent(Lfreemarker/core/TemplateElement;)V
    .registers 5
    .param p1, "element"    # Lfreemarker/core/TemplateElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    invoke-direct {p0, p1}, Lfreemarker/core/Environment;->replaceTopElement(Lfreemarker/core/TemplateElement;)Lfreemarker/core/TemplateElement;

    move-result-object v0

    .line 286
    .local v0, "parent":Lfreemarker/core/TemplateElement;
    :try_start_4
    invoke-virtual {p1, p0}, Lfreemarker/core/TemplateElement;->accept(Lfreemarker/core/Environment;)V
    :try_end_7
    .catch Lfreemarker/template/TemplateException; {:try_start_4 .. :try_end_7} :catch_b
    .catchall {:try_start_4 .. :try_end_7} :catchall_13

    .line 290
    invoke-direct {p0, v0}, Lfreemarker/core/Environment;->replaceTopElement(Lfreemarker/core/TemplateElement;)Lfreemarker/core/TemplateElement;

    .line 292
    :goto_a
    return-void

    .line 287
    :catch_b
    move-exception v1

    .line 288
    .local v1, "te":Lfreemarker/template/TemplateException;
    :try_start_c
    invoke-direct {p0, v1}, Lfreemarker/core/Environment;->handleTemplateException(Lfreemarker/template/TemplateException;)V
    :try_end_f
    .catchall {:try_start_c .. :try_end_f} :catchall_13

    .line 290
    invoke-direct {p0, v0}, Lfreemarker/core/Environment;->replaceTopElement(Lfreemarker/core/TemplateElement;)Lfreemarker/core/TemplateElement;

    goto :goto_a

    .end local v1    # "te":Lfreemarker/template/TemplateException;
    :catchall_13
    move-exception v2

    invoke-direct {p0, v0}, Lfreemarker/core/Environment;->replaceTopElement(Lfreemarker/core/TemplateElement;)Lfreemarker/core/TemplateElement;

    throw v2
.end method

.method visitIteratorBlock(Lfreemarker/core/IteratorBlock$Context;)V
    .registers 4
    .param p1, "ictxt"    # Lfreemarker/core/IteratorBlock$Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 507
    invoke-direct {p0, p1}, Lfreemarker/core/Environment;->pushLocalContext(Lfreemarker/core/LocalContext;)V

    .line 509
    :try_start_3
    invoke-virtual {p1, p0}, Lfreemarker/core/IteratorBlock$Context;->runLoop(Lfreemarker/core/Environment;)V
    :try_end_6
    .catch Lfreemarker/core/BreakInstruction$Break; {:try_start_3 .. :try_end_6} :catch_a
    .catch Lfreemarker/template/TemplateException; {:try_start_3 .. :try_end_6} :catch_f
    .catchall {:try_start_3 .. :try_end_6} :catchall_17

    .line 517
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    .line 519
    :goto_9
    return-void

    .line 511
    :catch_a
    move-exception v1

    .line 517
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    goto :goto_9

    .line 513
    :catch_f
    move-exception v0

    .line 514
    .local v0, "te":Lfreemarker/template/TemplateException;
    :try_start_10
    invoke-direct {p0, v0}, Lfreemarker/core/Environment;->handleTemplateException(Lfreemarker/template/TemplateException;)V
    :try_end_13
    .catchall {:try_start_10 .. :try_end_13} :catchall_17

    .line 517
    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    goto :goto_9

    .end local v0    # "te":Lfreemarker/template/TemplateException;
    :catchall_17
    move-exception v1

    invoke-direct {p0}, Lfreemarker/core/Environment;->popLocalContext()V

    throw v1
.end method

.method visitMacroDef(Lfreemarker/core/Macro;)V
    .registers 4
    .param p1, "macro"    # Lfreemarker/core/Macro;

    .prologue
    .line 712
    iget-object v0, p0, Lfreemarker/core/Environment;->macroToNamespaceLookup:Ljava/util/HashMap;

    iget-object v1, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {v0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 713
    iget-object v0, p0, Lfreemarker/core/Environment;->currentNamespace:Lfreemarker/core/Environment$Namespace;

    invoke-virtual {p1}, Lfreemarker/core/Macro;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Lfreemarker/core/Environment$Namespace;->put(Ljava/lang/String;Ljava/lang/Object;)V

    .line 714
    return-void
.end method
