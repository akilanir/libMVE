.class public Lfreemarker/core/Configurable;
.super Ljava/lang/Object;
.source "Configurable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lfreemarker/core/Configurable$1;,
        Lfreemarker/core/Configurable$SettingStringParser;,
        Lfreemarker/core/Configurable$KeyValuePair;,
        Lfreemarker/core/Configurable$UnknownSettingException;
    }
.end annotation


# static fields
.field private static final ALLOWED_CLASSES:Ljava/lang/String; = "allowed_classes"

.field public static final ARITHMETIC_ENGINE_KEY:Ljava/lang/String; = "arithmetic_engine"

.field public static final AUTO_FLUSH_KEY:Ljava/lang/String; = "auto_flush"

.field public static final BOOLEAN_FORMAT_KEY:Ljava/lang/String; = "boolean_format"

.field public static final CLASSIC_COMPATIBLE_KEY:Ljava/lang/String; = "classic_compatible"

.field static final C_TRUE_FALSE:Ljava/lang/String; = "true,false"

.field public static final DATETIME_FORMAT_KEY:Ljava/lang/String; = "datetime_format"

.field public static final DATE_FORMAT_KEY:Ljava/lang/String; = "date_format"

.field public static final LOCALE_KEY:Ljava/lang/String; = "locale"

.field public static final NEW_BUILTIN_CLASS_RESOLVER_KEY:Ljava/lang/String; = "new_builtin_class_resolver"

.field public static final NUMBER_FORMAT_KEY:Ljava/lang/String; = "number_format"

.field public static final OBJECT_WRAPPER_KEY:Ljava/lang/String; = "object_wrapper"

.field public static final OUTPUT_ENCODING_KEY:Ljava/lang/String; = "output_encoding"

.field public static final STRICT_BEAN_MODELS:Ljava/lang/String; = "strict_bean_models"

.field public static final TEMPLATE_EXCEPTION_HANDLER_KEY:Ljava/lang/String; = "template_exception_handler"

.field public static final TIME_FORMAT_KEY:Ljava/lang/String; = "time_format"

.field public static final TIME_ZONE_KEY:Ljava/lang/String; = "time_zone"

.field private static final TRUSTED_TEMPLATES:Ljava/lang/String; = "trusted_templates"

.field public static final URL_ESCAPING_CHARSET_KEY:Ljava/lang/String; = "url_escaping_charset"

.field static class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;


# instance fields
.field private arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

.field private autoFlush:Ljava/lang/Boolean;

.field private booleanFormat:Ljava/lang/String;

.field private classicCompatible:Ljava/lang/Integer;

.field private customAttributes:Ljava/util/HashMap;

.field private dateFormat:Ljava/lang/String;

.field private dateTimeFormat:Ljava/lang/String;

.field private falseStringValue:Ljava/lang/String;

.field private locale:Ljava/util/Locale;

.field private newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

.field private numberFormat:Ljava/lang/String;

.field private objectWrapper:Lfreemarker/template/ObjectWrapper;

.field private outputEncoding:Ljava/lang/String;

.field private outputEncodingSet:Z

.field private parent:Lfreemarker/core/Configurable;

.field private properties:Ljava/util/Properties;

.field private templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

.field private timeFormat:Ljava/lang/String;

.field private timeZone:Ljava/util/TimeZone;

.field private trueStringValue:Ljava/lang/String;

.field private urlEscapingCharset:Ljava/lang/String;

.field private urlEscapingCharsetSet:Z


# direct methods
.method public constructor <init>()V
    .registers 4

    .prologue
    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    const/4 v0, 0x0

    iput-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    .line 152
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    .line 153
    invoke-static {}, Ljava/util/TimeZone;->getDefault()Ljava/util/TimeZone;

    move-result-object v0

    iput-object v0, p0, Lfreemarker/core/Configurable;->timeZone:Ljava/util/TimeZone;

    .line 154
    const-string v0, "number"

    iput-object v0, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    .line 155
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/core/Configurable;->timeFormat:Ljava/lang/String;

    .line 156
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/core/Configurable;->dateFormat:Ljava/lang/String;

    .line 157
    const-string v0, ""

    iput-object v0, p0, Lfreemarker/core/Configurable;->dateTimeFormat:Ljava/lang/String;

    .line 158
    new-instance v0, Ljava/lang/Integer;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    .line 159
    sget-object v0, Lfreemarker/template/TemplateExceptionHandler;->DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    iput-object v0, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    .line 160
    sget-object v0, Lfreemarker/core/ArithmeticEngine;->BIGDECIMAL_ENGINE:Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

    iput-object v0, p0, Lfreemarker/core/Configurable;->arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

    .line 161
    sget-object v0, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    iput-object v0, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 162
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v0, p0, Lfreemarker/core/Configurable;->autoFlush:Ljava/lang/Boolean;

    .line 163
    sget-object v0, Lfreemarker/core/TemplateClassResolver;->UNRESTRICTED_RESOLVER:Lfreemarker/core/TemplateClassResolver;

    iput-object v0, p0, Lfreemarker/core/Configurable;->newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

    .line 167
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    .line 168
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "locale"

    iget-object v2, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    invoke-virtual {v2}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 169
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "time_format"

    iget-object v2, p0, Lfreemarker/core/Configurable;->timeFormat:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 170
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "date_format"

    iget-object v2, p0, Lfreemarker/core/Configurable;->dateFormat:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 171
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "datetime_format"

    iget-object v2, p0, Lfreemarker/core/Configurable;->dateTimeFormat:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 172
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "time_zone"

    iget-object v2, p0, Lfreemarker/core/Configurable;->timeZone:Ljava/util/TimeZone;

    invoke-virtual {v2}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 173
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "number_format"

    iget-object v2, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 174
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "classic_compatible"

    iget-object v2, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 175
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "template_exception_handler"

    iget-object v2, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 176
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "arithmetic_engine"

    iget-object v2, p0, Lfreemarker/core/Configurable;->arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 177
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "auto_flush"

    iget-object v2, p0, Lfreemarker/core/Configurable;->autoFlush:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 178
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "new_builtin_class_resolver"

    iget-object v2, p0, Lfreemarker/core/Configurable;->newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 182
    const-string v0, "true,false"

    invoke-virtual {p0, v0}, Lfreemarker/core/Configurable;->setBooleanFormat(Ljava/lang/String;)V

    .line 184
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    .line 185
    return-void
.end method

.method public constructor <init>(Lfreemarker/core/Configurable;)V
    .registers 4
    .param p1, "parent"    # Lfreemarker/core/Configurable;

    .prologue
    const/4 v0, 0x0

    .line 191
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 192
    iput-object p1, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    .line 193
    iput-object v0, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    .line 194
    iput-object v0, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    .line 195
    iput-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    .line 196
    iput-object v0, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    .line 197
    new-instance v0, Ljava/util/Properties;

    iget-object v1, p1, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    invoke-direct {v0, v1}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    iput-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    .line 198
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    .line 199
    return-void
.end method

.method static class$(Ljava/lang/String;)Ljava/lang/Class;
    .registers 4
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 1081
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

.method private classicCompatibilityIntToString(Ljava/lang/Integer;)Ljava/lang/String;
    .registers 4
    .param p1, "i"    # Ljava/lang/Integer;

    .prologue
    .line 258
    if-nez p1, :cond_4

    const/4 v0, 0x0

    .line 261
    :goto_3
    return-object v0

    .line 259
    :cond_4
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-nez v0, :cond_d

    const-string v0, "false"

    goto :goto_3

    .line 260
    :cond_d
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_17

    const-string v0, "true"

    goto :goto_3

    .line 261
    :cond_17
    invoke-virtual {p1}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_3
.end method

.method private getNullBooleanFormatErrorDescription()Lfreemarker/core/_ErrorDescriptionBuilder;
    .registers 10

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 447
    new-instance v1, Lfreemarker/core/_ErrorDescriptionBuilder;

    const/4 v0, 0x5

    new-array v2, v0, [Ljava/lang/Object;

    const-string v0, "Can\'t convert boolean to string automatically, because the \""

    aput-object v0, v2, v5

    const-string v0, "boolean_format"

    aput-object v0, v2, v6

    const-string v0, "\" setting was "

    aput-object v0, v2, v7

    new-instance v0, Lfreemarker/core/_DelayedJQuote;

    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getBooleanFormat()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v0, v2, v8

    const/4 v3, 0x4

    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getBooleanFormat()Ljava/lang/String;

    move-result-object v0

    const-string v4, "true,false"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_53

    const-string v0, ", which is the legacy default computer-language format, and hence isn\'t accepted."

    :goto_2f
    aput-object v0, v2, v3

    invoke-direct {v1, v2}, Lfreemarker/core/_ErrorDescriptionBuilder;-><init>([Ljava/lang/Object;)V

    new-array v0, v8, [Ljava/lang/Object;

    const-string v2, "If you just want \"true\"/\"false\" result as you are generting computer-language output, use \"?c\", like ${myBool?c}."

    aput-object v2, v0, v5

    const-string v2, "You can write myBool?string(\'yes\', \'no\') and like to specify boolean formatting in place."

    aput-object v2, v0, v6

    new-array v2, v8, [Ljava/lang/Object;

    const-string v3, "If you need the same two values on most places, the programmers should set the \""

    aput-object v3, v2, v5

    const-string v3, "boolean_format"

    aput-object v3, v2, v6

    const-string v3, "\" setting to something like \"yes,no\"."

    aput-object v3, v2, v7

    aput-object v2, v0, v7

    invoke-virtual {v1, v0}, Lfreemarker/core/_ErrorDescriptionBuilder;->tips([Ljava/lang/Object;)Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v0

    return-object v0

    :cond_53
    const-string v0, "."

    goto :goto_2f
.end method


# virtual methods
.method protected clone()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 202
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfreemarker/core/Configurable;

    .line 203
    .local v0, "copy":Lfreemarker/core/Configurable;
    new-instance v1, Ljava/util/Properties;

    iget-object v2, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    invoke-direct {v1, v2}, Ljava/util/Properties;-><init>(Ljava/util/Properties;)V

    iput-object v1, v0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    .line 204
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/util/HashMap;->clone()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashMap;

    iput-object v1, v0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    .line 205
    return-object v0
.end method

.method protected doAutoImportsAndIncludes(Lfreemarker/core/Environment;)V
    .registers 3
    .param p1, "env"    # Lfreemarker/core/Environment;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1271
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_9

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0, p1}, Lfreemarker/core/Configurable;->doAutoImportsAndIncludes(Lfreemarker/core/Environment;)V

    .line 1272
    :cond_9
    return-void
.end method

.method formatBoolean(ZZ)Ljava/lang/String;
    .registers 6
    .param p1, "value"    # Z
    .param p2, "fallbackToTrueFalse"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 421
    if-eqz p1, :cond_19

    .line 422
    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getTrueStringValue()Ljava/lang/String;

    move-result-object v0

    .line 423
    .local v0, "s":Ljava/lang/String;
    if-nez v0, :cond_17

    .line 424
    if-eqz p2, :cond_d

    .line 425
    const-string v1, "true"

    .line 441
    :goto_c
    return-object v1

    .line 427
    :cond_d
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {p0}, Lfreemarker/core/Configurable;->getNullBooleanFormatErrorDescription()Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v1

    :cond_17
    move-object v1, v0

    .line 430
    goto :goto_c

    .line 433
    .end local v0    # "s":Ljava/lang/String;
    :cond_19
    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getFalseStringValue()Ljava/lang/String;

    move-result-object v0

    .line 434
    .restart local v0    # "s":Ljava/lang/String;
    if-nez v0, :cond_2e

    .line 435
    if-eqz p2, :cond_24

    .line 436
    const-string v1, "false"

    goto :goto_c

    .line 438
    :cond_24
    new-instance v1, Lfreemarker/core/_MiscTemplateException;

    invoke-direct {p0}, Lfreemarker/core/Configurable;->getNullBooleanFormatErrorDescription()Lfreemarker/core/_ErrorDescriptionBuilder;

    move-result-object v2

    invoke-direct {v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/_ErrorDescriptionBuilder;)V

    throw v1

    :cond_2e
    move-object v1, v0

    .line 441
    goto :goto_c
.end method

.method public getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;
    .registers 2

    .prologue
    .line 601
    iget-object v0, p0, Lfreemarker/core/Configurable;->arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getArithmeticEngine()Lfreemarker/core/ArithmeticEngine;

    move-result-object v0

    goto :goto_6
.end method

.method public getAutoFlush()Z
    .registers 2

    .prologue
    .line 729
    iget-object v0, p0, Lfreemarker/core/Configurable;->autoFlush:Ljava/lang/Boolean;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/core/Configurable;->autoFlush:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_16

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getAutoFlush()Z

    move-result v0

    goto :goto_a

    :cond_16
    const/4 v0, 0x1

    goto :goto_a
.end method

.method public getBooleanFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 417
    iget-object v0, p0, Lfreemarker/core/Configurable;->booleanFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->booleanFormat:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getBooleanFormat()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getClassicCompatibleAsInt()I
    .registers 2

    .prologue
    .line 319
    iget-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    if-eqz v0, :cond_b

    iget-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    :goto_a
    return v0

    :cond_b
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getClassicCompatibleAsInt()I

    move-result v0

    goto :goto_a
.end method

.method getCustomAttribute(Ljava/lang/Object;Lfreemarker/core/CustomAttribute;)Ljava/lang/Object;
    .registers 6
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "attr"    # Lfreemarker/core/CustomAttribute;

    .prologue
    .line 1181
    iget-object v2, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v2

    .line 1182
    :try_start_3
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1183
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_1c

    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1c

    .line 1184
    invoke-virtual {p2}, Lfreemarker/core/CustomAttribute;->create()Ljava/lang/Object;

    move-result-object v0

    .line 1185
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1187
    :cond_1c
    monitor-exit v2

    return-object v0

    .line 1188
    .end local v0    # "o":Ljava/lang/Object;
    :catchall_1e
    move-exception v1

    monitor-exit v2
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_1e

    throw v1
.end method

.method public getCustomAttribute(Ljava/lang/String;)Ljava/lang/Object;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1256
    iget-object v2, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v2

    .line 1257
    :try_start_3
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 1258
    .local v0, "retval":Ljava/lang/Object;
    if-nez v0, :cond_16

    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_16

    .line 1259
    const/4 v0, 0x0

    monitor-exit v2

    .line 1265
    .end local v0    # "retval":Ljava/lang/Object;
    :cond_15
    :goto_15
    return-object v0

    .line 1261
    .restart local v0    # "retval":Ljava/lang/Object;
    :cond_16
    monitor-exit v2
    :try_end_17
    .catchall {:try_start_3 .. :try_end_17} :catchall_24

    .line 1262
    if-nez v0, :cond_15

    iget-object v1, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v1, :cond_15

    .line 1263
    iget-object v1, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v1, p1}, Lfreemarker/core/Configurable;->getCustomAttribute(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_15

    .line 1261
    .end local v0    # "retval":Ljava/lang/Object;
    :catchall_24
    move-exception v1

    :try_start_25
    monitor-exit v2
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_24

    throw v1
.end method

.method public getCustomAttributeNames()[Ljava/lang/String;
    .registers 5

    .prologue
    .line 1215
    iget-object v3, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v3

    .line 1216
    :try_start_3
    new-instance v1, Ljava/util/LinkedList;

    iget-object v2, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/LinkedList;-><init>(Ljava/util/Collection;)V

    .line 1217
    .local v1, "names":Ljava/util/Collection;
    invoke-interface {v1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iter":Ljava/util/Iterator;
    :cond_12
    :goto_12
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_27

    .line 1218
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Ljava/lang/String;

    if-nez v2, :cond_12

    .line 1219
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_12

    .line 1223
    .end local v0    # "iter":Ljava/util/Iterator;
    .end local v1    # "names":Ljava/util/Collection;
    :catchall_24
    move-exception v2

    monitor-exit v3
    :try_end_26
    .catchall {:try_start_3 .. :try_end_26} :catchall_24

    throw v2

    .line 1222
    .restart local v0    # "iter":Ljava/util/Iterator;
    .restart local v1    # "names":Ljava/util/Collection;
    :cond_27
    :try_start_27
    invoke-interface {v1}, Ljava/util/Collection;->size()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    check-cast v2, [Ljava/lang/String;

    monitor-exit v3
    :try_end_36
    .catchall {:try_start_27 .. :try_end_36} :catchall_24

    return-object v2
.end method

.method public getDateFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 527
    iget-object v0, p0, Lfreemarker/core/Configurable;->dateFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->dateFormat:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getDateFormat()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getDateTimeFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 550
    iget-object v0, p0, Lfreemarker/core/Configurable;->dateTimeFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->dateTimeFormat:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getDateTimeFormat()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method protected getEnvironment()Lfreemarker/core/Environment;
    .registers 2

    .prologue
    .line 1117
    instance-of v0, p0, Lfreemarker/core/Environment;

    if-eqz v0, :cond_7

    check-cast p0, Lfreemarker/core/Environment;

    .end local p0    # "this":Lfreemarker/core/Configurable;
    :goto_6
    return-object p0

    .restart local p0    # "this":Lfreemarker/core/Configurable;
    :cond_7
    invoke-static {}, Lfreemarker/core/Environment;->getCurrentEnvironment()Lfreemarker/core/Environment;

    move-result-object p0

    goto :goto_6
.end method

.method getFalseStringValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 485
    iget-object v0, p0, Lfreemarker/core/Configurable;->booleanFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->falseStringValue:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getFalseStringValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getLocale()Ljava/util/Locale;
    .registers 2

    .prologue
    .line 357
    iget-object v0, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getLocale()Ljava/util/Locale;

    move-result-object v0

    goto :goto_6
.end method

.method public getNewBuiltinClassResolver()Lfreemarker/core/TemplateClassResolver;
    .registers 2

    .prologue
    .line 698
    iget-object v0, p0, Lfreemarker/core/Configurable;->newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getNewBuiltinClassResolver()Lfreemarker/core/TemplateClassResolver;

    move-result-object v0

    goto :goto_6
.end method

.method public getNumberFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 374
    iget-object v0, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getNumberFormat()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getObjectWrapper()Lfreemarker/template/ObjectWrapper;
    .registers 2

    .prologue
    .line 619
    iget-object v0, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getObjectWrapper()Lfreemarker/template/ObjectWrapper;

    move-result-object v0

    goto :goto_6
.end method

.method public getOutputEncoding()Ljava/lang/String;
    .registers 2

    .prologue
    .line 643
    iget-boolean v0, p0, Lfreemarker/core/Configurable;->outputEncodingSet:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->outputEncoding:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getOutputEncoding()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public final getParent()Lfreemarker/core/Configurable;
    .registers 2

    .prologue
    .line 219
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    return-object v0
.end method

.method public getSetting(Ljava/lang/String;)Ljava/lang/String;
    .registers 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 1098
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    invoke-virtual {v0, p1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getSettings()Ljava/util/Map;
    .registers 2

    .prologue
    .line 1113
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getTemplateExceptionHandler()Lfreemarker/template/TemplateExceptionHandler;
    .registers 2

    .prologue
    .line 583
    iget-object v0, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getTemplateExceptionHandler()Lfreemarker/template/TemplateExceptionHandler;

    move-result-object v0

    goto :goto_6
.end method

.method public getTimeFormat()Ljava/lang/String;
    .registers 2

    .prologue
    .line 506
    iget-object v0, p0, Lfreemarker/core/Configurable;->timeFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->timeFormat:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getTimeFormat()Ljava/lang/String;

    move-result-object v0

    goto :goto_6
.end method

.method public getTimeZone()Ljava/util/TimeZone;
    .registers 2

    .prologue
    .line 338
    iget-object v0, p0, Lfreemarker/core/Configurable;->timeZone:Ljava/util/TimeZone;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->timeZone:Ljava/util/TimeZone;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getTimeZone()Ljava/util/TimeZone;

    move-result-object v0

    goto :goto_6
.end method

.method getTrueStringValue()Ljava/lang/String;
    .registers 2

    .prologue
    .line 476
    iget-object v0, p0, Lfreemarker/core/Configurable;->booleanFormat:Ljava/lang/String;

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->trueStringValue:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getTrueStringValue()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method public getURLEscapingCharset()Ljava/lang/String;
    .registers 2

    .prologue
    .line 666
    iget-boolean v0, p0, Lfreemarker/core/Configurable;->urlEscapingCharsetSet:Z

    if-eqz v0, :cond_7

    iget-object v0, p0, Lfreemarker/core/Configurable;->urlEscapingCharset:Ljava/lang/String;

    :goto_6
    return-object v0

    :cond_7
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    if-eqz v0, :cond_12

    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->getURLEscapingCharset()Ljava/lang/String;

    move-result-object v0

    goto :goto_6

    :cond_12
    const/4 v0, 0x0

    goto :goto_6
.end method

.method protected invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;
    .registers 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 1127
    new-instance v0, Lfreemarker/core/_MiscTemplateException;

    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "Invalid value for setting "

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v4, p1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v4, v2, v3

    const/4 v3, 0x2

    const-string v4, ": "

    aput-object v4, v2, v3

    const/4 v3, 0x3

    new-instance v4, Lfreemarker/core/_DelayedJQuote;

    invoke-direct {v4, p2}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v4, v2, v3

    invoke-direct {v0, v1, v2}, Lfreemarker/core/_MiscTemplateException;-><init>(Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    return-object v0
.end method

.method public isClassicCompatible()Z
    .registers 2

    .prologue
    .line 315
    iget-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    if-eqz v0, :cond_10

    iget-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    :goto_d
    return v0

    :cond_e
    const/4 v0, 0x0

    goto :goto_d

    :cond_10
    iget-object v0, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    invoke-virtual {v0}, Lfreemarker/core/Configurable;->isClassicCompatible()Z

    move-result v0

    goto :goto_d
.end method

.method protected parseAsImportList(Ljava/lang/String;)Ljava/util/HashMap;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1284
    new-instance v0, Lfreemarker/core/Configurable$SettingStringParser;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lfreemarker/core/Configurable$SettingStringParser;-><init>(Ljava/lang/String;Lfreemarker/core/Configurable$1;)V

    invoke-virtual {v0}, Lfreemarker/core/Configurable$SettingStringParser;->parseAsImportList()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method protected parseAsList(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1275
    new-instance v0, Lfreemarker/core/Configurable$SettingStringParser;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lfreemarker/core/Configurable$SettingStringParser;-><init>(Ljava/lang/String;Lfreemarker/core/Configurable$1;)V

    invoke-virtual {v0}, Lfreemarker/core/Configurable$SettingStringParser;->parseAsList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method protected parseAsSegmentedList(Ljava/lang/String;)Ljava/util/ArrayList;
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/core/ParseException;
        }
    .end annotation

    .prologue
    .line 1280
    new-instance v0, Lfreemarker/core/Configurable$SettingStringParser;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lfreemarker/core/Configurable$SettingStringParser;-><init>(Ljava/lang/String;Lfreemarker/core/Configurable$1;)V

    invoke-virtual {v0}, Lfreemarker/core/Configurable$SettingStringParser;->parseAsSegmentedList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public removeCustomAttribute(Ljava/lang/String;)V
    .registers 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1237
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v1

    .line 1238
    :try_start_3
    iget-object v0, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1239
    monitor-exit v1

    .line 1240
    return-void

    .line 1239
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public setArithmeticEngine(Lfreemarker/core/ArithmeticEngine;)V
    .registers 5
    .param p1, "arithmeticEngine"    # Lfreemarker/core/ArithmeticEngine;

    .prologue
    .line 592
    const-string v0, "arithmeticEngine"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 593
    iput-object p1, p0, Lfreemarker/core/Configurable;->arithmeticEngine:Lfreemarker/core/ArithmeticEngine;

    .line 594
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "arithmetic_engine"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 595
    return-void
.end method

.method public setAutoFlush(Z)V
    .registers 5
    .param p1, "autoFlush"    # Z

    .prologue
    .line 719
    if-eqz p1, :cond_12

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    :goto_4
    iput-object v0, p0, Lfreemarker/core/Configurable;->autoFlush:Ljava/lang/Boolean;

    .line 720
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "auto_flush"

    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 721
    return-void

    .line 719
    :cond_12
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_4
.end method

.method public setBooleanFormat(Ljava/lang/String;)V
    .registers 6
    .param p1, "booleanFormat"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 390
    const-string v1, "booleanFormat"

    invoke-static {v1, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 392
    const/16 v1, 0x2c

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 393
    .local v0, "commaIdx":I
    const/4 v1, -0x1

    if-ne v0, v1, :cond_17

    .line 394
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Setting \"boolean_format\" must consist of two comma-separated values for true and false,respectively."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 399
    :cond_17
    iput-object p1, p0, Lfreemarker/core/Configurable;->booleanFormat:Ljava/lang/String;

    .line 400
    iget-object v1, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v2, "boolean_format"

    invoke-virtual {v1, v2, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 402
    const-string v1, "true,false"

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    .line 405
    iput-object v3, p0, Lfreemarker/core/Configurable;->trueStringValue:Ljava/lang/String;

    .line 406
    iput-object v3, p0, Lfreemarker/core/Configurable;->falseStringValue:Ljava/lang/String;

    .line 411
    :goto_2c
    return-void

    .line 408
    :cond_2d
    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/core/Configurable;->trueStringValue:Ljava/lang/String;

    .line 409
    add-int/lit8 v1, v0, 0x1

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lfreemarker/core/Configurable;->falseStringValue:Ljava/lang/String;

    goto :goto_2c
.end method

.method public setClassicCompatible(Z)V
    .registers 5
    .param p1, "classicCompatibility"    # Z

    .prologue
    .line 236
    new-instance v1, Ljava/lang/Integer;

    if-eqz p1, :cond_18

    const/4 v0, 0x1

    :goto_5
    invoke-direct {v1, v0}, Ljava/lang/Integer;-><init>(I)V

    iput-object v1, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    .line 237
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "classic_compatible"

    iget-object v2, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    invoke-direct {p0, v2}, Lfreemarker/core/Configurable;->classicCompatibilityIntToString(Ljava/lang/Integer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 238
    return-void

    .line 236
    :cond_18
    const/4 v0, 0x0

    goto :goto_5
.end method

.method public setClassicCompatibleAsInt(I)V
    .registers 5
    .param p1, "classicCompatibility"    # I

    .prologue
    .line 251
    if-ltz p1, :cond_5

    const/4 v0, 0x2

    if-le p1, v0, :cond_1e

    .line 252
    :cond_5
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "Unsupported \"classicCompatibility\": "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 254
    :cond_1e
    new-instance v0, Ljava/lang/Integer;

    invoke-direct {v0, p1}, Ljava/lang/Integer;-><init>(I)V

    iput-object v0, p0, Lfreemarker/core/Configurable;->classicCompatible:Ljava/lang/Integer;

    .line 255
    return-void
.end method

.method setCustomAttribute(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .param p1, "key"    # Ljava/lang/Object;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1172
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v1

    .line 1173
    :try_start_3
    iget-object v0, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1174
    monitor-exit v1

    .line 1175
    return-void

    .line 1174
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public setCustomAttribute(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 1201
    iget-object v1, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    monitor-enter v1

    .line 1202
    :try_start_3
    iget-object v0, p0, Lfreemarker/core/Configurable;->customAttributes:Ljava/util/HashMap;

    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1203
    monitor-exit v1

    .line 1204
    return-void

    .line 1203
    :catchall_a
    move-exception v0

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_a

    throw v0
.end method

.method public setDateFormat(Ljava/lang/String;)V
    .registers 4
    .param p1, "dateFormat"    # Ljava/lang/String;

    .prologue
    .line 518
    const-string v0, "dateFormat"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 519
    iput-object p1, p0, Lfreemarker/core/Configurable;->dateFormat:Ljava/lang/String;

    .line 520
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "date_format"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 521
    return-void
.end method

.method public setDateTimeFormat(Ljava/lang/String;)V
    .registers 4
    .param p1, "dateTimeFormat"    # Ljava/lang/String;

    .prologue
    .line 541
    const-string v0, "dateTimeFormat"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 542
    iput-object p1, p0, Lfreemarker/core/Configurable;->dateTimeFormat:Ljava/lang/String;

    .line 543
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "datetime_format"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 544
    return-void
.end method

.method public setLocale(Ljava/util/Locale;)V
    .registers 5
    .param p1, "locale"    # Ljava/util/Locale;

    .prologue
    .line 329
    const-string v0, "locale"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 330
    iput-object p1, p0, Lfreemarker/core/Configurable;->locale:Ljava/util/Locale;

    .line 331
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "locale"

    invoke-virtual {p1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 332
    return-void
.end method

.method public setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V
    .registers 5
    .param p1, "newBuiltinClassResolver"    # Lfreemarker/core/TemplateClassResolver;

    .prologue
    .line 685
    const-string v0, "newBuiltinClassResolver"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 686
    iput-object p1, p0, Lfreemarker/core/Configurable;->newBuiltinClassResolver:Lfreemarker/core/TemplateClassResolver;

    .line 687
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "new_builtin_class_resolver"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 689
    return-void
.end method

.method public setNumberFormat(Ljava/lang/String;)V
    .registers 4
    .param p1, "numberFormat"    # Ljava/lang/String;

    .prologue
    .line 364
    const-string v0, "numberFormat"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 365
    iput-object p1, p0, Lfreemarker/core/Configurable;->numberFormat:Ljava/lang/String;

    .line 366
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "number_format"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 367
    return-void
.end method

.method public setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V
    .registers 5
    .param p1, "objectWrapper"    # Lfreemarker/template/ObjectWrapper;

    .prologue
    .line 610
    const-string v0, "objectWrapper"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 611
    iput-object p1, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    .line 612
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "object_wrapper"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 613
    return-void
.end method

.method public setOutputEncoding(Ljava/lang/String;)V
    .registers 4
    .param p1, "outputEncoding"    # Ljava/lang/String;

    .prologue
    .line 632
    iput-object p1, p0, Lfreemarker/core/Configurable;->outputEncoding:Ljava/lang/String;

    .line 634
    if-eqz p1, :cond_f

    .line 635
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "output_encoding"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 639
    :goto_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/Configurable;->outputEncodingSet:Z

    .line 640
    return-void

    .line 637
    :cond_f
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "output_encoding"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method

.method final setParent(Lfreemarker/core/Configurable;)V
    .registers 2
    .param p1, "parent"    # Lfreemarker/core/Configurable;

    .prologue
    .line 228
    iput-object p1, p0, Lfreemarker/core/Configurable;->parent:Lfreemarker/core/Configurable;

    .line 229
    return-void
.end method

.method public setSetting(Ljava/lang/String;Ljava/lang/String;)V
    .registers 20
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 943
    :try_start_0
    const-string v12, "locale"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_14

    .line 944
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/StringUtil;->deduceLocale(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setLocale(Ljava/util/Locale;)V

    .line 1076
    :goto_13
    return-void

    .line 945
    :cond_14
    const-string v12, "number_format"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5b

    .line 946
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setNumberFormat(Ljava/lang/String;)V
    :try_end_25
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_25} :catch_26

    goto :goto_13

    .line 1071
    :catch_26
    move-exception v4

    .line 1072
    .local v4, "e":Ljava/lang/Exception;
    new-instance v12, Lfreemarker/core/_MiscTemplateException;

    invoke-virtual/range {p0 .. p0}, Lfreemarker/core/Configurable;->getEnvironment()Lfreemarker/core/Environment;

    move-result-object v13

    const/4 v14, 0x5

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    const-string v16, "Failed to set setting "

    aput-object v16, v14, v15

    const/4 v15, 0x1

    new-instance v16, Lfreemarker/core/_DelayedJQuote;

    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-direct {v0, v1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    const/4 v15, 0x2

    const-string v16, " to value "

    aput-object v16, v14, v15

    const/4 v15, 0x3

    new-instance v16, Lfreemarker/core/_DelayedJQuote;

    move-object/from16 v0, v16

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lfreemarker/core/_DelayedJQuote;-><init>(Ljava/lang/Object;)V

    aput-object v16, v14, v15

    const/4 v15, 0x4

    const-string v16, "; see cause exception."

    aput-object v16, v14, v15

    invoke-direct {v12, v4, v13, v14}, Lfreemarker/core/_MiscTemplateException;-><init>(Ljava/lang/Throwable;Lfreemarker/core/Environment;[Ljava/lang/Object;)V

    throw v12

    .line 947
    .end local v4    # "e":Ljava/lang/Exception;
    :cond_5b
    :try_start_5b
    const-string v12, "time_format"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_6d

    .line 948
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setTimeFormat(Ljava/lang/String;)V

    goto :goto_13

    .line 949
    :cond_6d
    const-string v12, "date_format"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_7f

    .line 950
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setDateFormat(Ljava/lang/String;)V

    goto :goto_13

    .line 951
    :cond_7f
    const-string v12, "datetime_format"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_91

    .line 952
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setDateTimeFormat(Ljava/lang/String;)V

    goto :goto_13

    .line 953
    :cond_91
    const-string v12, "time_zone"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_a6

    .line 954
    invoke-static/range {p2 .. p2}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTimeZone(Ljava/util/TimeZone;)V

    goto/16 :goto_13

    .line 955
    :cond_a6
    const-string v12, "classic_compatible"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_e5

    .line 957
    if-eqz p2, :cond_d8

    invoke-virtual/range {p2 .. p2}, Ljava/lang/String;->length()I

    move-result v12

    if-lez v12, :cond_d8

    .line 958
    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 962
    .local v5, "firstChar":C
    :goto_bf
    invoke-static {v5}, Ljava/lang/Character;->isDigit(C)Z

    move-result v12

    if-nez v12, :cond_cd

    const/16 v12, 0x2b

    if-eq v5, v12, :cond_cd

    const/16 v12, 0x2d

    if-ne v5, v12, :cond_da

    .line 963
    :cond_cd
    invoke-static/range {p2 .. p2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setClassicCompatibleAsInt(I)V

    goto/16 :goto_13

    .line 960
    .end local v5    # "firstChar":C
    :cond_d8
    const/4 v5, 0x0

    .restart local v5    # "firstChar":C
    goto :goto_bf

    .line 965
    :cond_da
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setClassicCompatible(Z)V

    goto/16 :goto_13

    .line 967
    .end local v5    # "firstChar":C
    :cond_e5
    const-string v12, "template_exception_handler"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_15c

    .line 968
    const/16 v12, 0x2e

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_14b

    .line 969
    const-string v12, "debug"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_10d

    .line 970
    sget-object v12, Lfreemarker/template/TemplateExceptionHandler;->DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_13

    .line 972
    :cond_10d
    const-string v12, "html_debug"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_120

    .line 973
    sget-object v12, Lfreemarker/template/TemplateExceptionHandler;->HTML_DEBUG_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_13

    .line 975
    :cond_120
    const-string v12, "ignore"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_133

    .line 976
    sget-object v12, Lfreemarker/template/TemplateExceptionHandler;->IGNORE_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_13

    .line 978
    :cond_133
    const-string v12, "rethrow"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_146

    .line 979
    sget-object v12, Lfreemarker/template/TemplateExceptionHandler;->RETHROW_HANDLER:Lfreemarker/template/TemplateExceptionHandler;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_13

    .line 982
    :cond_146
    invoke-virtual/range {p0 .. p2}, Lfreemarker/core/Configurable;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v12

    throw v12

    .line 985
    :cond_14b
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/template/TemplateExceptionHandler;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V

    goto/16 :goto_13

    .line 989
    :cond_15c
    const-string v12, "arithmetic_engine"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_1ad

    .line 990
    const/16 v12, 0x2e

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_19c

    .line 991
    const-string v12, "bigdecimal"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_184

    .line 992
    sget-object v12, Lfreemarker/core/ArithmeticEngine;->BIGDECIMAL_ENGINE:Lfreemarker/core/ArithmeticEngine$BigDecimalEngine;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setArithmeticEngine(Lfreemarker/core/ArithmeticEngine;)V

    goto/16 :goto_13

    .line 993
    :cond_184
    const-string v12, "conservative"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_197

    .line 994
    sget-object v12, Lfreemarker/core/ArithmeticEngine;->CONSERVATIVE_ENGINE:Lfreemarker/core/ArithmeticEngine$ConservativeEngine;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setArithmeticEngine(Lfreemarker/core/ArithmeticEngine;)V

    goto/16 :goto_13

    .line 996
    :cond_197
    invoke-virtual/range {p0 .. p2}, Lfreemarker/core/Configurable;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v12

    throw v12

    .line 999
    :cond_19c
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/core/ArithmeticEngine;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setArithmeticEngine(Lfreemarker/core/ArithmeticEngine;)V

    goto/16 :goto_13

    .line 1003
    :cond_1ad
    const-string v12, "object_wrapper"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_235

    .line 1004
    const/16 v12, 0x2e

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_224

    .line 1005
    const-string v12, "default"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1d5

    .line 1006
    sget-object v12, Lfreemarker/template/ObjectWrapper;->DEFAULT_WRAPPER:Lfreemarker/template/ObjectWrapper;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    goto/16 :goto_13

    .line 1007
    :cond_1d5
    const-string v12, "simple"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1e8

    .line 1008
    sget-object v12, Lfreemarker/template/ObjectWrapper;->SIMPLE_WRAPPER:Lfreemarker/template/ObjectWrapper;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    goto/16 :goto_13

    .line 1009
    :cond_1e8
    const-string v12, "beans"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_1fb

    .line 1010
    sget-object v12, Lfreemarker/template/ObjectWrapper;->BEANS_WRAPPER:Lfreemarker/template/ObjectWrapper;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    goto/16 :goto_13

    .line 1011
    :cond_1fb
    const-string v12, "jython"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_21f

    .line 1012
    const-string v12, "freemarker.ext.jython.JythonWrapper"

    invoke-static {v12}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v3

    .line 1014
    .local v3, "clazz":Ljava/lang/Class;
    const-string v12, "INSTANCE"

    invoke-virtual {v3, v12}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v12

    const/4 v13, 0x0

    invoke-virtual {v12, v13}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/template/ObjectWrapper;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    goto/16 :goto_13

    .line 1017
    .end local v3    # "clazz":Ljava/lang/Class;
    :cond_21f
    invoke-virtual/range {p0 .. p2}, Lfreemarker/core/Configurable;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v12

    throw v12

    .line 1021
    :cond_224
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/template/ObjectWrapper;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setObjectWrapper(Lfreemarker/template/ObjectWrapper;)V

    goto/16 :goto_13

    .line 1024
    :cond_235
    const-string v12, "boolean_format"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_248

    .line 1025
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setBooleanFormat(Ljava/lang/String;)V

    goto/16 :goto_13

    .line 1026
    :cond_248
    const-string v12, "output_encoding"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_25b

    .line 1027
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setOutputEncoding(Ljava/lang/String;)V

    goto/16 :goto_13

    .line 1028
    :cond_25b
    const-string v12, "url_escaping_charset"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_26e

    .line 1029
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->setURLEscapingCharset(Ljava/lang/String;)V

    goto/16 :goto_13

    .line 1030
    :cond_26e
    const-string v12, "strict_bean_models"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_283

    .line 1031
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setStrictBeanModels(Z)V

    goto/16 :goto_13

    .line 1032
    :cond_283
    const-string v12, "auto_flush"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_298

    .line 1033
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/StringUtil;->getYesNo(Ljava/lang/String;)Z

    move-result v12

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setAutoFlush(Z)V

    goto/16 :goto_13

    .line 1034
    :cond_298
    const-string v12, "new_builtin_class_resolver"

    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_38d

    .line 1035
    const-string v12, "unrestricted"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2b5

    .line 1036
    sget-object v12, Lfreemarker/core/TemplateClassResolver;->UNRESTRICTED_RESOLVER:Lfreemarker/core/TemplateClassResolver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V

    goto/16 :goto_13

    .line 1037
    :cond_2b5
    const-string v12, "safer"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2c8

    .line 1038
    sget-object v12, Lfreemarker/core/TemplateClassResolver;->SAFER_RESOLVER:Lfreemarker/core/TemplateClassResolver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V

    goto/16 :goto_13

    .line 1039
    :cond_2c8
    const-string v12, "allows_nothing"

    move-object/from16 v0, p2

    invoke-virtual {v12, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_2db

    .line 1040
    sget-object v12, Lfreemarker/core/TemplateClassResolver;->ALLOWS_NOTHING_RESOLVER:Lfreemarker/core/TemplateClassResolver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V

    goto/16 :goto_13

    .line 1041
    :cond_2db
    const-string v12, ":"

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v12

    const/4 v13, -0x1

    if-eq v12, v13, :cond_36c

    .line 1042
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lfreemarker/core/Configurable;->parseAsSegmentedList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v10

    .line 1043
    .local v10, "segments":Ljava/util/List;
    const/4 v2, 0x0

    .line 1044
    .local v2, "allowedClasses":Ljava/util/Set;
    const/4 v11, 0x0

    .line 1045
    .local v11, "trustedTemplates":Ljava/util/List;
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_2f1
    invoke-interface {v10}, Ljava/util/List;->size()I

    move-result v12

    if-ge v6, v12, :cond_360

    .line 1046
    invoke-interface {v10, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lfreemarker/core/Configurable$KeyValuePair;

    .line 1047
    .local v7, "kv":Lfreemarker/core/Configurable$KeyValuePair;
    invoke-virtual {v7}, Lfreemarker/core/Configurable$KeyValuePair;->getKey()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 1048
    .local v8, "segmentKey":Ljava/lang/String;
    invoke-virtual {v7}, Lfreemarker/core/Configurable$KeyValuePair;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    .line 1049
    .local v9, "segmentValue":Ljava/util/List;
    const-string v12, "allowed_classes"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_319

    .line 1050
    new-instance v2, Ljava/util/HashSet;

    .end local v2    # "allowedClasses":Ljava/util/Set;
    invoke-direct {v2, v9}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 1045
    .restart local v2    # "allowedClasses":Ljava/util/Set;
    :goto_316
    add-int/lit8 v6, v6, 0x1

    goto :goto_2f1

    .line 1051
    :cond_319
    const-string v12, "trusted_templates"

    invoke-virtual {v8, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_323

    .line 1052
    move-object v11, v9

    goto :goto_316

    .line 1054
    :cond_323
    new-instance v12, Lfreemarker/core/ParseException;

    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    const-string v14, "Unrecognized list segment key: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-static {v8}, Lfreemarker/template/utility/StringUtil;->jQuote(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string v14, ". Supported keys are: \""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string v14, "allowed_classes"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string v14, "\", \""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string v14, "trusted_templates"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    const-string v14, "\""

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-direct {v12, v13, v14, v15}, Lfreemarker/core/ParseException;-><init>(Ljava/lang/String;II)V

    throw v12

    .line 1060
    .end local v7    # "kv":Lfreemarker/core/Configurable$KeyValuePair;
    .end local v8    # "segmentKey":Ljava/lang/String;
    .end local v9    # "segmentValue":Ljava/util/List;
    :cond_360
    new-instance v12, Lfreemarker/core/OptInTemplateClassResolver;

    invoke-direct {v12, v2, v11}, Lfreemarker/core/OptInTemplateClassResolver;-><init>(Ljava/util/Set;Ljava/util/List;)V

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V

    goto/16 :goto_13

    .line 1062
    .end local v2    # "allowedClasses":Ljava/util/Set;
    .end local v6    # "i":I
    .end local v10    # "segments":Ljava/util/List;
    .end local v11    # "trustedTemplates":Ljava/util/List;
    :cond_36c
    const/16 v12, 0x2e

    move-object/from16 v0, p2

    invoke-virtual {v0, v12}, Ljava/lang/String;->indexOf(I)I

    move-result v12

    const/4 v13, -0x1

    if-ne v12, v13, :cond_388

    .line 1063
    invoke-static/range {p2 .. p2}, Lfreemarker/template/utility/ClassUtil;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lfreemarker/core/TemplateClassResolver;

    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lfreemarker/core/Configurable;->setNewBuiltinClassResolver(Lfreemarker/core/TemplateClassResolver;)V

    goto/16 :goto_13

    .line 1066
    :cond_388
    invoke-virtual/range {p0 .. p2}, Lfreemarker/core/Configurable;->invalidSettingValueException(Ljava/lang/String;Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v12

    throw v12

    .line 1069
    :cond_38d
    invoke-virtual/range {p0 .. p1}, Lfreemarker/core/Configurable;->unknownSettingException(Ljava/lang/String;)Lfreemarker/template/TemplateException;

    move-result-object v12

    throw v12
    :try_end_392
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_392} :catch_26
.end method

.method public setSettings(Ljava/io/InputStream;)V
    .registers 3
    .param p1, "propsIn"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 1163
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 1164
    .local v0, "p":Ljava/util/Properties;
    invoke-virtual {v0, p1}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V

    .line 1165
    invoke-virtual {p0, v0}, Lfreemarker/core/Configurable;->setSettings(Ljava/util/Properties;)V

    .line 1166
    return-void
.end method

.method public setSettings(Ljava/util/Properties;)V
    .registers 5
    .param p1, "props"    # Ljava/util/Properties;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lfreemarker/template/TemplateException;
        }
    .end annotation

    .prologue
    .line 1146
    invoke-virtual {p1}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 1147
    .local v0, "it":Ljava/util/Iterator;
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_20

    .line 1148
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 1149
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p1, v1}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v1, v2}, Lfreemarker/core/Configurable;->setSetting(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 1151
    .end local v1    # "key":Ljava/lang/String;
    :cond_20
    return-void
.end method

.method public setStrictBeanModels(Z)V
    .registers 5
    .param p1, "strict"    # Z

    .prologue
    .line 1079
    iget-object v0, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    instance-of v0, v0, Lfreemarker/ext/beans/BeansWrapper;

    if-nez v0, :cond_38

    .line 1080
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v2, "The value of the object_wrapper setting isn\'t a "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    sget-object v0, Lfreemarker/core/Configurable;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    if-nez v0, :cond_35

    const-string v0, "freemarker.ext.beans.BeansWrapper"

    invoke-static {v0}, Lfreemarker/core/Configurable;->class$(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    sput-object v0, Lfreemarker/core/Configurable;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    :goto_1f
    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    const-string v2, "."

    invoke-virtual {v0, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_35
    sget-object v0, Lfreemarker/core/Configurable;->class$freemarker$ext$beans$BeansWrapper:Ljava/lang/Class;

    goto :goto_1f

    .line 1083
    :cond_38
    iget-object v0, p0, Lfreemarker/core/Configurable;->objectWrapper:Lfreemarker/template/ObjectWrapper;

    check-cast v0, Lfreemarker/ext/beans/BeansWrapper;

    invoke-virtual {v0, p1}, Lfreemarker/ext/beans/BeansWrapper;->setStrict(Z)V

    .line 1084
    return-void
.end method

.method public setTemplateExceptionHandler(Lfreemarker/template/TemplateExceptionHandler;)V
    .registers 5
    .param p1, "templateExceptionHandler"    # Lfreemarker/template/TemplateExceptionHandler;

    .prologue
    .line 574
    const-string v0, "templateExceptionHandler"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 575
    iput-object p1, p0, Lfreemarker/core/Configurable;->templateExceptionHandler:Lfreemarker/template/TemplateExceptionHandler;

    .line 576
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "template_exception_handler"

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 577
    return-void
.end method

.method public setTimeFormat(Ljava/lang/String;)V
    .registers 4
    .param p1, "timeFormat"    # Ljava/lang/String;

    .prologue
    .line 497
    const-string v0, "timeFormat"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 498
    iput-object p1, p0, Lfreemarker/core/Configurable;->timeFormat:Ljava/lang/String;

    .line 499
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "time_format"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 500
    return-void
.end method

.method public setTimeZone(Ljava/util/TimeZone;)V
    .registers 5
    .param p1, "timeZone"    # Ljava/util/TimeZone;

    .prologue
    .line 347
    const-string v0, "timeZone"

    invoke-static {v0, p1}, Lfreemarker/template/utility/NullArgumentException;->check(Ljava/lang/String;Ljava/lang/Object;)V

    .line 348
    iput-object p1, p0, Lfreemarker/core/Configurable;->timeZone:Ljava/util/TimeZone;

    .line 349
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "time_zone"

    invoke-virtual {p1}, Ljava/util/TimeZone;->getID()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 350
    return-void
.end method

.method public setURLEscapingCharset(Ljava/lang/String;)V
    .registers 4
    .param p1, "urlEscapingCharset"    # Ljava/lang/String;

    .prologue
    .line 655
    iput-object p1, p0, Lfreemarker/core/Configurable;->urlEscapingCharset:Ljava/lang/String;

    .line 657
    if-eqz p1, :cond_f

    .line 658
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "url_escaping_charset"

    invoke-virtual {v0, v1, p1}, Ljava/util/Properties;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    .line 662
    :goto_b
    const/4 v0, 0x1

    iput-boolean v0, p0, Lfreemarker/core/Configurable;->urlEscapingCharsetSet:Z

    .line 663
    return-void

    .line 660
    :cond_f
    iget-object v0, p0, Lfreemarker/core/Configurable;->properties:Ljava/util/Properties;

    const-string v1, "url_escaping_charset"

    invoke-virtual {v0, v1}, Ljava/util/Properties;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b
.end method

.method protected unknownSettingException(Ljava/lang/String;)Lfreemarker/template/TemplateException;
    .registers 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 1123
    new-instance v0, Lfreemarker/core/Configurable$UnknownSettingException;

    invoke-virtual {p0}, Lfreemarker/core/Configurable;->getEnvironment()Lfreemarker/core/Environment;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lfreemarker/core/Configurable$UnknownSettingException;-><init>(Ljava/lang/String;Lfreemarker/core/Environment;Lfreemarker/core/Configurable$1;)V

    return-object v0
.end method
