// ORM class for table 'W_DMS_DEALER_D1'
// WARNING: This class is AUTO-GENERATED. Modify at your own risk.
//
// Debug information:
// Generated date: Thu Jul 11 16:05:31 CST 2019
// For connector: org.apache.sqoop.manager.OracleManager
import org.apache.hadoop.io.BytesWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.mapred.lib.db.DBWritable;
import com.cloudera.sqoop.lib.JdbcWritableBridge;
import com.cloudera.sqoop.lib.DelimiterSet;
import com.cloudera.sqoop.lib.FieldFormatter;
import com.cloudera.sqoop.lib.RecordParser;
import com.cloudera.sqoop.lib.BooleanParser;
import com.cloudera.sqoop.lib.BlobRef;
import com.cloudera.sqoop.lib.ClobRef;
import com.cloudera.sqoop.lib.LargeObjectLoader;
import com.cloudera.sqoop.lib.SqoopRecord;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.DataInput;
import java.io.DataOutput;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.CharBuffer;
import java.sql.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

public class W_DMS_DEALER_D1 extends SqoopRecord  implements DBWritable, Writable {
  private final int PROTOCOL_VERSION = 3;
  public int getClassFormatVersion() { return PROTOCOL_VERSION; }
  public static interface FieldSetterCommand {    void setField(Object value);  }  protected ResultSet __cur_result_set;
  private Map<String, FieldSetterCommand> setters = new HashMap<String, FieldSetterCommand>();
  private void init0() {
    setters.put("ROW_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ROW_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("INTEGRATION_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        INTEGRATION_ID = (String)value;
      }
    });
    setters.put("DEALER_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_CODE = (String)value;
      }
    });
    setters.put("DEALER_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_NAME = (String)value;
      }
    });
    setters.put("DEALER_SHORT_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_SHORT_NAME = (String)value;
      }
    });
    setters.put("PARTNER_DEALER_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PARTNER_DEALER_CODE = (String)value;
      }
    });
    setters.put("PARTNER_DEALER_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PARTNER_DEALER_NAME = (String)value;
      }
    });
    setters.put("BG_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_CODE = (String)value;
      }
    });
    setters.put("BG_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_NAME = (String)value;
      }
    });
    setters.put("BG_AREA_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_AREA_NAME = (String)value;
      }
    });
    setters.put("BG_REGION_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_REGION_NAME = (String)value;
      }
    });
    setters.put("BG_CITY_GROUP_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_CITY_GROUP_NAME = (String)value;
      }
    });
    setters.put("BG_CITY_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        BG_CITY_NAME = (String)value;
      }
    });
    setters.put("WAREHOUSE_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        WAREHOUSE_NAME = (String)value;
      }
    });
    setters.put("PROVINCE_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        PROVINCE_NAME = (String)value;
      }
    });
    setters.put("CITY_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CITY_NAME = (String)value;
      }
    });
    setters.put("COUNTY_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        COUNTY_NAME = (String)value;
      }
    });
    setters.put("RESPONSIBLE_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RESPONSIBLE_NAME = (String)value;
      }
    });
    setters.put("RESPONSIBLE_PHONE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RESPONSIBLE_PHONE = (String)value;
      }
    });
    setters.put("EMAIL_ADDR", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        EMAIL_ADDR = (String)value;
      }
    });
    setters.put("OFFICE_ADDR", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        OFFICE_ADDR = (String)value;
      }
    });
    setters.put("RECEIVE_ADDR", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RECEIVE_ADDR = (String)value;
      }
    });
    setters.put("RECEIVE_NAME", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RECEIVE_NAME = (String)value;
      }
    });
    setters.put("RECEIVE_PHONE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        RECEIVE_PHONE = (String)value;
      }
    });
    setters.put("DEALER_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_TYPE = (String)value;
      }
    });
    setters.put("DEALER_LEVEL", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_LEVEL = (String)value;
      }
    });
    setters.put("CHANNEL_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CHANNEL_TYPE = (String)value;
      }
    });
    setters.put("CREATED_BY_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CREATED_BY_ID = (String)value;
      }
    });
    setters.put("CHANGED_BY_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CHANGED_BY_ID = (String)value;
      }
    });
    setters.put("CREATED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CREATED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("AUX1_CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUX1_CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("AUX2_CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUX2_CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("AUX3_CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUX3_CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("AUX4_CHANGED_ON_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AUX4_CHANGED_ON_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("W_INSERT_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_INSERT_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("W_UPDATE_DT", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        W_UPDATE_DT = (java.sql.Timestamp)value;
      }
    });
    setters.put("ETL_PROC_WID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ETL_PROC_WID = (java.math.BigDecimal)value;
      }
    });
    setters.put("DATE_FROM", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_FROM = (java.sql.Timestamp)value;
      }
    });
    setters.put("DATE_TO", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATE_TO = (java.sql.Timestamp)value;
      }
    });
    setters.put("VERSION", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        VERSION = (java.math.BigDecimal)value;
      }
    });
    setters.put("ROW_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        ROW_ID = (String)value;
      }
    });
    setters.put("DEALER_ERP_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DEALER_ERP_CODE = (String)value;
      }
    });
    setters.put("DATASOURCE_ID", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        DATASOURCE_ID = (String)value;
      }
    });
    setters.put("AREA_CODE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        AREA_CODE = (String)value;
      }
    });
    setters.put("SALE_TYPE", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        SALE_TYPE = (String)value;
      }
    });
    setters.put("IS_WAREHOUSE_CUSTOMER", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        IS_WAREHOUSE_CUSTOMER = (String)value;
      }
    });
    setters.put("TEST_FLG", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        TEST_FLG = (String)value;
      }
    });
    setters.put("STATUS", new FieldSetterCommand() {
      @Override
      public void setField(Object value) {
        STATUS = (String)value;
      }
    });
  }
  public W_DMS_DEALER_D1() {
    init0();
  }
  private java.math.BigDecimal ROW_WID;
  public java.math.BigDecimal get_ROW_WID() {
    return ROW_WID;
  }
  public void set_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
  }
  public W_DMS_DEALER_D1 with_ROW_WID(java.math.BigDecimal ROW_WID) {
    this.ROW_WID = ROW_WID;
    return this;
  }
  private String INTEGRATION_ID;
  public String get_INTEGRATION_ID() {
    return INTEGRATION_ID;
  }
  public void set_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
  }
  public W_DMS_DEALER_D1 with_INTEGRATION_ID(String INTEGRATION_ID) {
    this.INTEGRATION_ID = INTEGRATION_ID;
    return this;
  }
  private String DEALER_CODE;
  public String get_DEALER_CODE() {
    return DEALER_CODE;
  }
  public void set_DEALER_CODE(String DEALER_CODE) {
    this.DEALER_CODE = DEALER_CODE;
  }
  public W_DMS_DEALER_D1 with_DEALER_CODE(String DEALER_CODE) {
    this.DEALER_CODE = DEALER_CODE;
    return this;
  }
  private String DEALER_NAME;
  public String get_DEALER_NAME() {
    return DEALER_NAME;
  }
  public void set_DEALER_NAME(String DEALER_NAME) {
    this.DEALER_NAME = DEALER_NAME;
  }
  public W_DMS_DEALER_D1 with_DEALER_NAME(String DEALER_NAME) {
    this.DEALER_NAME = DEALER_NAME;
    return this;
  }
  private String DEALER_SHORT_NAME;
  public String get_DEALER_SHORT_NAME() {
    return DEALER_SHORT_NAME;
  }
  public void set_DEALER_SHORT_NAME(String DEALER_SHORT_NAME) {
    this.DEALER_SHORT_NAME = DEALER_SHORT_NAME;
  }
  public W_DMS_DEALER_D1 with_DEALER_SHORT_NAME(String DEALER_SHORT_NAME) {
    this.DEALER_SHORT_NAME = DEALER_SHORT_NAME;
    return this;
  }
  private String PARTNER_DEALER_CODE;
  public String get_PARTNER_DEALER_CODE() {
    return PARTNER_DEALER_CODE;
  }
  public void set_PARTNER_DEALER_CODE(String PARTNER_DEALER_CODE) {
    this.PARTNER_DEALER_CODE = PARTNER_DEALER_CODE;
  }
  public W_DMS_DEALER_D1 with_PARTNER_DEALER_CODE(String PARTNER_DEALER_CODE) {
    this.PARTNER_DEALER_CODE = PARTNER_DEALER_CODE;
    return this;
  }
  private String PARTNER_DEALER_NAME;
  public String get_PARTNER_DEALER_NAME() {
    return PARTNER_DEALER_NAME;
  }
  public void set_PARTNER_DEALER_NAME(String PARTNER_DEALER_NAME) {
    this.PARTNER_DEALER_NAME = PARTNER_DEALER_NAME;
  }
  public W_DMS_DEALER_D1 with_PARTNER_DEALER_NAME(String PARTNER_DEALER_NAME) {
    this.PARTNER_DEALER_NAME = PARTNER_DEALER_NAME;
    return this;
  }
  private String BG_CODE;
  public String get_BG_CODE() {
    return BG_CODE;
  }
  public void set_BG_CODE(String BG_CODE) {
    this.BG_CODE = BG_CODE;
  }
  public W_DMS_DEALER_D1 with_BG_CODE(String BG_CODE) {
    this.BG_CODE = BG_CODE;
    return this;
  }
  private String BG_NAME;
  public String get_BG_NAME() {
    return BG_NAME;
  }
  public void set_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
  }
  public W_DMS_DEALER_D1 with_BG_NAME(String BG_NAME) {
    this.BG_NAME = BG_NAME;
    return this;
  }
  private String BG_AREA_NAME;
  public String get_BG_AREA_NAME() {
    return BG_AREA_NAME;
  }
  public void set_BG_AREA_NAME(String BG_AREA_NAME) {
    this.BG_AREA_NAME = BG_AREA_NAME;
  }
  public W_DMS_DEALER_D1 with_BG_AREA_NAME(String BG_AREA_NAME) {
    this.BG_AREA_NAME = BG_AREA_NAME;
    return this;
  }
  private String BG_REGION_NAME;
  public String get_BG_REGION_NAME() {
    return BG_REGION_NAME;
  }
  public void set_BG_REGION_NAME(String BG_REGION_NAME) {
    this.BG_REGION_NAME = BG_REGION_NAME;
  }
  public W_DMS_DEALER_D1 with_BG_REGION_NAME(String BG_REGION_NAME) {
    this.BG_REGION_NAME = BG_REGION_NAME;
    return this;
  }
  private String BG_CITY_GROUP_NAME;
  public String get_BG_CITY_GROUP_NAME() {
    return BG_CITY_GROUP_NAME;
  }
  public void set_BG_CITY_GROUP_NAME(String BG_CITY_GROUP_NAME) {
    this.BG_CITY_GROUP_NAME = BG_CITY_GROUP_NAME;
  }
  public W_DMS_DEALER_D1 with_BG_CITY_GROUP_NAME(String BG_CITY_GROUP_NAME) {
    this.BG_CITY_GROUP_NAME = BG_CITY_GROUP_NAME;
    return this;
  }
  private String BG_CITY_NAME;
  public String get_BG_CITY_NAME() {
    return BG_CITY_NAME;
  }
  public void set_BG_CITY_NAME(String BG_CITY_NAME) {
    this.BG_CITY_NAME = BG_CITY_NAME;
  }
  public W_DMS_DEALER_D1 with_BG_CITY_NAME(String BG_CITY_NAME) {
    this.BG_CITY_NAME = BG_CITY_NAME;
    return this;
  }
  private String WAREHOUSE_NAME;
  public String get_WAREHOUSE_NAME() {
    return WAREHOUSE_NAME;
  }
  public void set_WAREHOUSE_NAME(String WAREHOUSE_NAME) {
    this.WAREHOUSE_NAME = WAREHOUSE_NAME;
  }
  public W_DMS_DEALER_D1 with_WAREHOUSE_NAME(String WAREHOUSE_NAME) {
    this.WAREHOUSE_NAME = WAREHOUSE_NAME;
    return this;
  }
  private String PROVINCE_NAME;
  public String get_PROVINCE_NAME() {
    return PROVINCE_NAME;
  }
  public void set_PROVINCE_NAME(String PROVINCE_NAME) {
    this.PROVINCE_NAME = PROVINCE_NAME;
  }
  public W_DMS_DEALER_D1 with_PROVINCE_NAME(String PROVINCE_NAME) {
    this.PROVINCE_NAME = PROVINCE_NAME;
    return this;
  }
  private String CITY_NAME;
  public String get_CITY_NAME() {
    return CITY_NAME;
  }
  public void set_CITY_NAME(String CITY_NAME) {
    this.CITY_NAME = CITY_NAME;
  }
  public W_DMS_DEALER_D1 with_CITY_NAME(String CITY_NAME) {
    this.CITY_NAME = CITY_NAME;
    return this;
  }
  private String COUNTY_NAME;
  public String get_COUNTY_NAME() {
    return COUNTY_NAME;
  }
  public void set_COUNTY_NAME(String COUNTY_NAME) {
    this.COUNTY_NAME = COUNTY_NAME;
  }
  public W_DMS_DEALER_D1 with_COUNTY_NAME(String COUNTY_NAME) {
    this.COUNTY_NAME = COUNTY_NAME;
    return this;
  }
  private String RESPONSIBLE_NAME;
  public String get_RESPONSIBLE_NAME() {
    return RESPONSIBLE_NAME;
  }
  public void set_RESPONSIBLE_NAME(String RESPONSIBLE_NAME) {
    this.RESPONSIBLE_NAME = RESPONSIBLE_NAME;
  }
  public W_DMS_DEALER_D1 with_RESPONSIBLE_NAME(String RESPONSIBLE_NAME) {
    this.RESPONSIBLE_NAME = RESPONSIBLE_NAME;
    return this;
  }
  private String RESPONSIBLE_PHONE;
  public String get_RESPONSIBLE_PHONE() {
    return RESPONSIBLE_PHONE;
  }
  public void set_RESPONSIBLE_PHONE(String RESPONSIBLE_PHONE) {
    this.RESPONSIBLE_PHONE = RESPONSIBLE_PHONE;
  }
  public W_DMS_DEALER_D1 with_RESPONSIBLE_PHONE(String RESPONSIBLE_PHONE) {
    this.RESPONSIBLE_PHONE = RESPONSIBLE_PHONE;
    return this;
  }
  private String EMAIL_ADDR;
  public String get_EMAIL_ADDR() {
    return EMAIL_ADDR;
  }
  public void set_EMAIL_ADDR(String EMAIL_ADDR) {
    this.EMAIL_ADDR = EMAIL_ADDR;
  }
  public W_DMS_DEALER_D1 with_EMAIL_ADDR(String EMAIL_ADDR) {
    this.EMAIL_ADDR = EMAIL_ADDR;
    return this;
  }
  private String OFFICE_ADDR;
  public String get_OFFICE_ADDR() {
    return OFFICE_ADDR;
  }
  public void set_OFFICE_ADDR(String OFFICE_ADDR) {
    this.OFFICE_ADDR = OFFICE_ADDR;
  }
  public W_DMS_DEALER_D1 with_OFFICE_ADDR(String OFFICE_ADDR) {
    this.OFFICE_ADDR = OFFICE_ADDR;
    return this;
  }
  private String RECEIVE_ADDR;
  public String get_RECEIVE_ADDR() {
    return RECEIVE_ADDR;
  }
  public void set_RECEIVE_ADDR(String RECEIVE_ADDR) {
    this.RECEIVE_ADDR = RECEIVE_ADDR;
  }
  public W_DMS_DEALER_D1 with_RECEIVE_ADDR(String RECEIVE_ADDR) {
    this.RECEIVE_ADDR = RECEIVE_ADDR;
    return this;
  }
  private String RECEIVE_NAME;
  public String get_RECEIVE_NAME() {
    return RECEIVE_NAME;
  }
  public void set_RECEIVE_NAME(String RECEIVE_NAME) {
    this.RECEIVE_NAME = RECEIVE_NAME;
  }
  public W_DMS_DEALER_D1 with_RECEIVE_NAME(String RECEIVE_NAME) {
    this.RECEIVE_NAME = RECEIVE_NAME;
    return this;
  }
  private String RECEIVE_PHONE;
  public String get_RECEIVE_PHONE() {
    return RECEIVE_PHONE;
  }
  public void set_RECEIVE_PHONE(String RECEIVE_PHONE) {
    this.RECEIVE_PHONE = RECEIVE_PHONE;
  }
  public W_DMS_DEALER_D1 with_RECEIVE_PHONE(String RECEIVE_PHONE) {
    this.RECEIVE_PHONE = RECEIVE_PHONE;
    return this;
  }
  private String DEALER_TYPE;
  public String get_DEALER_TYPE() {
    return DEALER_TYPE;
  }
  public void set_DEALER_TYPE(String DEALER_TYPE) {
    this.DEALER_TYPE = DEALER_TYPE;
  }
  public W_DMS_DEALER_D1 with_DEALER_TYPE(String DEALER_TYPE) {
    this.DEALER_TYPE = DEALER_TYPE;
    return this;
  }
  private String DEALER_LEVEL;
  public String get_DEALER_LEVEL() {
    return DEALER_LEVEL;
  }
  public void set_DEALER_LEVEL(String DEALER_LEVEL) {
    this.DEALER_LEVEL = DEALER_LEVEL;
  }
  public W_DMS_DEALER_D1 with_DEALER_LEVEL(String DEALER_LEVEL) {
    this.DEALER_LEVEL = DEALER_LEVEL;
    return this;
  }
  private String CHANNEL_TYPE;
  public String get_CHANNEL_TYPE() {
    return CHANNEL_TYPE;
  }
  public void set_CHANNEL_TYPE(String CHANNEL_TYPE) {
    this.CHANNEL_TYPE = CHANNEL_TYPE;
  }
  public W_DMS_DEALER_D1 with_CHANNEL_TYPE(String CHANNEL_TYPE) {
    this.CHANNEL_TYPE = CHANNEL_TYPE;
    return this;
  }
  private String CREATED_BY_ID;
  public String get_CREATED_BY_ID() {
    return CREATED_BY_ID;
  }
  public void set_CREATED_BY_ID(String CREATED_BY_ID) {
    this.CREATED_BY_ID = CREATED_BY_ID;
  }
  public W_DMS_DEALER_D1 with_CREATED_BY_ID(String CREATED_BY_ID) {
    this.CREATED_BY_ID = CREATED_BY_ID;
    return this;
  }
  private String CHANGED_BY_ID;
  public String get_CHANGED_BY_ID() {
    return CHANGED_BY_ID;
  }
  public void set_CHANGED_BY_ID(String CHANGED_BY_ID) {
    this.CHANGED_BY_ID = CHANGED_BY_ID;
  }
  public W_DMS_DEALER_D1 with_CHANGED_BY_ID(String CHANGED_BY_ID) {
    this.CHANGED_BY_ID = CHANGED_BY_ID;
    return this;
  }
  private java.sql.Timestamp CREATED_ON_DT;
  public java.sql.Timestamp get_CREATED_ON_DT() {
    return CREATED_ON_DT;
  }
  public void set_CREATED_ON_DT(java.sql.Timestamp CREATED_ON_DT) {
    this.CREATED_ON_DT = CREATED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_CREATED_ON_DT(java.sql.Timestamp CREATED_ON_DT) {
    this.CREATED_ON_DT = CREATED_ON_DT;
    return this;
  }
  private java.sql.Timestamp CHANGED_ON_DT;
  public java.sql.Timestamp get_CHANGED_ON_DT() {
    return CHANGED_ON_DT;
  }
  public void set_CHANGED_ON_DT(java.sql.Timestamp CHANGED_ON_DT) {
    this.CHANGED_ON_DT = CHANGED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_CHANGED_ON_DT(java.sql.Timestamp CHANGED_ON_DT) {
    this.CHANGED_ON_DT = CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp AUX1_CHANGED_ON_DT;
  public java.sql.Timestamp get_AUX1_CHANGED_ON_DT() {
    return AUX1_CHANGED_ON_DT;
  }
  public void set_AUX1_CHANGED_ON_DT(java.sql.Timestamp AUX1_CHANGED_ON_DT) {
    this.AUX1_CHANGED_ON_DT = AUX1_CHANGED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_AUX1_CHANGED_ON_DT(java.sql.Timestamp AUX1_CHANGED_ON_DT) {
    this.AUX1_CHANGED_ON_DT = AUX1_CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp AUX2_CHANGED_ON_DT;
  public java.sql.Timestamp get_AUX2_CHANGED_ON_DT() {
    return AUX2_CHANGED_ON_DT;
  }
  public void set_AUX2_CHANGED_ON_DT(java.sql.Timestamp AUX2_CHANGED_ON_DT) {
    this.AUX2_CHANGED_ON_DT = AUX2_CHANGED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_AUX2_CHANGED_ON_DT(java.sql.Timestamp AUX2_CHANGED_ON_DT) {
    this.AUX2_CHANGED_ON_DT = AUX2_CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp AUX3_CHANGED_ON_DT;
  public java.sql.Timestamp get_AUX3_CHANGED_ON_DT() {
    return AUX3_CHANGED_ON_DT;
  }
  public void set_AUX3_CHANGED_ON_DT(java.sql.Timestamp AUX3_CHANGED_ON_DT) {
    this.AUX3_CHANGED_ON_DT = AUX3_CHANGED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_AUX3_CHANGED_ON_DT(java.sql.Timestamp AUX3_CHANGED_ON_DT) {
    this.AUX3_CHANGED_ON_DT = AUX3_CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp AUX4_CHANGED_ON_DT;
  public java.sql.Timestamp get_AUX4_CHANGED_ON_DT() {
    return AUX4_CHANGED_ON_DT;
  }
  public void set_AUX4_CHANGED_ON_DT(java.sql.Timestamp AUX4_CHANGED_ON_DT) {
    this.AUX4_CHANGED_ON_DT = AUX4_CHANGED_ON_DT;
  }
  public W_DMS_DEALER_D1 with_AUX4_CHANGED_ON_DT(java.sql.Timestamp AUX4_CHANGED_ON_DT) {
    this.AUX4_CHANGED_ON_DT = AUX4_CHANGED_ON_DT;
    return this;
  }
  private java.sql.Timestamp W_INSERT_DT;
  public java.sql.Timestamp get_W_INSERT_DT() {
    return W_INSERT_DT;
  }
  public void set_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
  }
  public W_DMS_DEALER_D1 with_W_INSERT_DT(java.sql.Timestamp W_INSERT_DT) {
    this.W_INSERT_DT = W_INSERT_DT;
    return this;
  }
  private java.sql.Timestamp W_UPDATE_DT;
  public java.sql.Timestamp get_W_UPDATE_DT() {
    return W_UPDATE_DT;
  }
  public void set_W_UPDATE_DT(java.sql.Timestamp W_UPDATE_DT) {
    this.W_UPDATE_DT = W_UPDATE_DT;
  }
  public W_DMS_DEALER_D1 with_W_UPDATE_DT(java.sql.Timestamp W_UPDATE_DT) {
    this.W_UPDATE_DT = W_UPDATE_DT;
    return this;
  }
  private java.math.BigDecimal ETL_PROC_WID;
  public java.math.BigDecimal get_ETL_PROC_WID() {
    return ETL_PROC_WID;
  }
  public void set_ETL_PROC_WID(java.math.BigDecimal ETL_PROC_WID) {
    this.ETL_PROC_WID = ETL_PROC_WID;
  }
  public W_DMS_DEALER_D1 with_ETL_PROC_WID(java.math.BigDecimal ETL_PROC_WID) {
    this.ETL_PROC_WID = ETL_PROC_WID;
    return this;
  }
  private java.sql.Timestamp DATE_FROM;
  public java.sql.Timestamp get_DATE_FROM() {
    return DATE_FROM;
  }
  public void set_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
  }
  public W_DMS_DEALER_D1 with_DATE_FROM(java.sql.Timestamp DATE_FROM) {
    this.DATE_FROM = DATE_FROM;
    return this;
  }
  private java.sql.Timestamp DATE_TO;
  public java.sql.Timestamp get_DATE_TO() {
    return DATE_TO;
  }
  public void set_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
  }
  public W_DMS_DEALER_D1 with_DATE_TO(java.sql.Timestamp DATE_TO) {
    this.DATE_TO = DATE_TO;
    return this;
  }
  private java.math.BigDecimal VERSION;
  public java.math.BigDecimal get_VERSION() {
    return VERSION;
  }
  public void set_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
  }
  public W_DMS_DEALER_D1 with_VERSION(java.math.BigDecimal VERSION) {
    this.VERSION = VERSION;
    return this;
  }
  private String ROW_ID;
  public String get_ROW_ID() {
    return ROW_ID;
  }
  public void set_ROW_ID(String ROW_ID) {
    this.ROW_ID = ROW_ID;
  }
  public W_DMS_DEALER_D1 with_ROW_ID(String ROW_ID) {
    this.ROW_ID = ROW_ID;
    return this;
  }
  private String DEALER_ERP_CODE;
  public String get_DEALER_ERP_CODE() {
    return DEALER_ERP_CODE;
  }
  public void set_DEALER_ERP_CODE(String DEALER_ERP_CODE) {
    this.DEALER_ERP_CODE = DEALER_ERP_CODE;
  }
  public W_DMS_DEALER_D1 with_DEALER_ERP_CODE(String DEALER_ERP_CODE) {
    this.DEALER_ERP_CODE = DEALER_ERP_CODE;
    return this;
  }
  private String DATASOURCE_ID;
  public String get_DATASOURCE_ID() {
    return DATASOURCE_ID;
  }
  public void set_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
  }
  public W_DMS_DEALER_D1 with_DATASOURCE_ID(String DATASOURCE_ID) {
    this.DATASOURCE_ID = DATASOURCE_ID;
    return this;
  }
  private String AREA_CODE;
  public String get_AREA_CODE() {
    return AREA_CODE;
  }
  public void set_AREA_CODE(String AREA_CODE) {
    this.AREA_CODE = AREA_CODE;
  }
  public W_DMS_DEALER_D1 with_AREA_CODE(String AREA_CODE) {
    this.AREA_CODE = AREA_CODE;
    return this;
  }
  private String SALE_TYPE;
  public String get_SALE_TYPE() {
    return SALE_TYPE;
  }
  public void set_SALE_TYPE(String SALE_TYPE) {
    this.SALE_TYPE = SALE_TYPE;
  }
  public W_DMS_DEALER_D1 with_SALE_TYPE(String SALE_TYPE) {
    this.SALE_TYPE = SALE_TYPE;
    return this;
  }
  private String IS_WAREHOUSE_CUSTOMER;
  public String get_IS_WAREHOUSE_CUSTOMER() {
    return IS_WAREHOUSE_CUSTOMER;
  }
  public void set_IS_WAREHOUSE_CUSTOMER(String IS_WAREHOUSE_CUSTOMER) {
    this.IS_WAREHOUSE_CUSTOMER = IS_WAREHOUSE_CUSTOMER;
  }
  public W_DMS_DEALER_D1 with_IS_WAREHOUSE_CUSTOMER(String IS_WAREHOUSE_CUSTOMER) {
    this.IS_WAREHOUSE_CUSTOMER = IS_WAREHOUSE_CUSTOMER;
    return this;
  }
  private String TEST_FLG;
  public String get_TEST_FLG() {
    return TEST_FLG;
  }
  public void set_TEST_FLG(String TEST_FLG) {
    this.TEST_FLG = TEST_FLG;
  }
  public W_DMS_DEALER_D1 with_TEST_FLG(String TEST_FLG) {
    this.TEST_FLG = TEST_FLG;
    return this;
  }
  private String STATUS;
  public String get_STATUS() {
    return STATUS;
  }
  public void set_STATUS(String STATUS) {
    this.STATUS = STATUS;
  }
  public W_DMS_DEALER_D1 with_STATUS(String STATUS) {
    this.STATUS = STATUS;
    return this;
  }
  public boolean equals(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_DMS_DEALER_D1)) {
      return false;
    }
    W_DMS_DEALER_D1 that = (W_DMS_DEALER_D1) o;
    boolean equal = true;
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.DEALER_CODE == null ? that.DEALER_CODE == null : this.DEALER_CODE.equals(that.DEALER_CODE));
    equal = equal && (this.DEALER_NAME == null ? that.DEALER_NAME == null : this.DEALER_NAME.equals(that.DEALER_NAME));
    equal = equal && (this.DEALER_SHORT_NAME == null ? that.DEALER_SHORT_NAME == null : this.DEALER_SHORT_NAME.equals(that.DEALER_SHORT_NAME));
    equal = equal && (this.PARTNER_DEALER_CODE == null ? that.PARTNER_DEALER_CODE == null : this.PARTNER_DEALER_CODE.equals(that.PARTNER_DEALER_CODE));
    equal = equal && (this.PARTNER_DEALER_NAME == null ? that.PARTNER_DEALER_NAME == null : this.PARTNER_DEALER_NAME.equals(that.PARTNER_DEALER_NAME));
    equal = equal && (this.BG_CODE == null ? that.BG_CODE == null : this.BG_CODE.equals(that.BG_CODE));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.BG_AREA_NAME == null ? that.BG_AREA_NAME == null : this.BG_AREA_NAME.equals(that.BG_AREA_NAME));
    equal = equal && (this.BG_REGION_NAME == null ? that.BG_REGION_NAME == null : this.BG_REGION_NAME.equals(that.BG_REGION_NAME));
    equal = equal && (this.BG_CITY_GROUP_NAME == null ? that.BG_CITY_GROUP_NAME == null : this.BG_CITY_GROUP_NAME.equals(that.BG_CITY_GROUP_NAME));
    equal = equal && (this.BG_CITY_NAME == null ? that.BG_CITY_NAME == null : this.BG_CITY_NAME.equals(that.BG_CITY_NAME));
    equal = equal && (this.WAREHOUSE_NAME == null ? that.WAREHOUSE_NAME == null : this.WAREHOUSE_NAME.equals(that.WAREHOUSE_NAME));
    equal = equal && (this.PROVINCE_NAME == null ? that.PROVINCE_NAME == null : this.PROVINCE_NAME.equals(that.PROVINCE_NAME));
    equal = equal && (this.CITY_NAME == null ? that.CITY_NAME == null : this.CITY_NAME.equals(that.CITY_NAME));
    equal = equal && (this.COUNTY_NAME == null ? that.COUNTY_NAME == null : this.COUNTY_NAME.equals(that.COUNTY_NAME));
    equal = equal && (this.RESPONSIBLE_NAME == null ? that.RESPONSIBLE_NAME == null : this.RESPONSIBLE_NAME.equals(that.RESPONSIBLE_NAME));
    equal = equal && (this.RESPONSIBLE_PHONE == null ? that.RESPONSIBLE_PHONE == null : this.RESPONSIBLE_PHONE.equals(that.RESPONSIBLE_PHONE));
    equal = equal && (this.EMAIL_ADDR == null ? that.EMAIL_ADDR == null : this.EMAIL_ADDR.equals(that.EMAIL_ADDR));
    equal = equal && (this.OFFICE_ADDR == null ? that.OFFICE_ADDR == null : this.OFFICE_ADDR.equals(that.OFFICE_ADDR));
    equal = equal && (this.RECEIVE_ADDR == null ? that.RECEIVE_ADDR == null : this.RECEIVE_ADDR.equals(that.RECEIVE_ADDR));
    equal = equal && (this.RECEIVE_NAME == null ? that.RECEIVE_NAME == null : this.RECEIVE_NAME.equals(that.RECEIVE_NAME));
    equal = equal && (this.RECEIVE_PHONE == null ? that.RECEIVE_PHONE == null : this.RECEIVE_PHONE.equals(that.RECEIVE_PHONE));
    equal = equal && (this.DEALER_TYPE == null ? that.DEALER_TYPE == null : this.DEALER_TYPE.equals(that.DEALER_TYPE));
    equal = equal && (this.DEALER_LEVEL == null ? that.DEALER_LEVEL == null : this.DEALER_LEVEL.equals(that.DEALER_LEVEL));
    equal = equal && (this.CHANNEL_TYPE == null ? that.CHANNEL_TYPE == null : this.CHANNEL_TYPE.equals(that.CHANNEL_TYPE));
    equal = equal && (this.CREATED_BY_ID == null ? that.CREATED_BY_ID == null : this.CREATED_BY_ID.equals(that.CREATED_BY_ID));
    equal = equal && (this.CHANGED_BY_ID == null ? that.CHANGED_BY_ID == null : this.CHANGED_BY_ID.equals(that.CHANGED_BY_ID));
    equal = equal && (this.CREATED_ON_DT == null ? that.CREATED_ON_DT == null : this.CREATED_ON_DT.equals(that.CREATED_ON_DT));
    equal = equal && (this.CHANGED_ON_DT == null ? that.CHANGED_ON_DT == null : this.CHANGED_ON_DT.equals(that.CHANGED_ON_DT));
    equal = equal && (this.AUX1_CHANGED_ON_DT == null ? that.AUX1_CHANGED_ON_DT == null : this.AUX1_CHANGED_ON_DT.equals(that.AUX1_CHANGED_ON_DT));
    equal = equal && (this.AUX2_CHANGED_ON_DT == null ? that.AUX2_CHANGED_ON_DT == null : this.AUX2_CHANGED_ON_DT.equals(that.AUX2_CHANGED_ON_DT));
    equal = equal && (this.AUX3_CHANGED_ON_DT == null ? that.AUX3_CHANGED_ON_DT == null : this.AUX3_CHANGED_ON_DT.equals(that.AUX3_CHANGED_ON_DT));
    equal = equal && (this.AUX4_CHANGED_ON_DT == null ? that.AUX4_CHANGED_ON_DT == null : this.AUX4_CHANGED_ON_DT.equals(that.AUX4_CHANGED_ON_DT));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.ETL_PROC_WID == null ? that.ETL_PROC_WID == null : this.ETL_PROC_WID.equals(that.ETL_PROC_WID));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.ROW_ID == null ? that.ROW_ID == null : this.ROW_ID.equals(that.ROW_ID));
    equal = equal && (this.DEALER_ERP_CODE == null ? that.DEALER_ERP_CODE == null : this.DEALER_ERP_CODE.equals(that.DEALER_ERP_CODE));
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.AREA_CODE == null ? that.AREA_CODE == null : this.AREA_CODE.equals(that.AREA_CODE));
    equal = equal && (this.SALE_TYPE == null ? that.SALE_TYPE == null : this.SALE_TYPE.equals(that.SALE_TYPE));
    equal = equal && (this.IS_WAREHOUSE_CUSTOMER == null ? that.IS_WAREHOUSE_CUSTOMER == null : this.IS_WAREHOUSE_CUSTOMER.equals(that.IS_WAREHOUSE_CUSTOMER));
    equal = equal && (this.TEST_FLG == null ? that.TEST_FLG == null : this.TEST_FLG.equals(that.TEST_FLG));
    equal = equal && (this.STATUS == null ? that.STATUS == null : this.STATUS.equals(that.STATUS));
    return equal;
  }
  public boolean equals0(Object o) {
    if (this == o) {
      return true;
    }
    if (!(o instanceof W_DMS_DEALER_D1)) {
      return false;
    }
    W_DMS_DEALER_D1 that = (W_DMS_DEALER_D1) o;
    boolean equal = true;
    equal = equal && (this.ROW_WID == null ? that.ROW_WID == null : this.ROW_WID.equals(that.ROW_WID));
    equal = equal && (this.INTEGRATION_ID == null ? that.INTEGRATION_ID == null : this.INTEGRATION_ID.equals(that.INTEGRATION_ID));
    equal = equal && (this.DEALER_CODE == null ? that.DEALER_CODE == null : this.DEALER_CODE.equals(that.DEALER_CODE));
    equal = equal && (this.DEALER_NAME == null ? that.DEALER_NAME == null : this.DEALER_NAME.equals(that.DEALER_NAME));
    equal = equal && (this.DEALER_SHORT_NAME == null ? that.DEALER_SHORT_NAME == null : this.DEALER_SHORT_NAME.equals(that.DEALER_SHORT_NAME));
    equal = equal && (this.PARTNER_DEALER_CODE == null ? that.PARTNER_DEALER_CODE == null : this.PARTNER_DEALER_CODE.equals(that.PARTNER_DEALER_CODE));
    equal = equal && (this.PARTNER_DEALER_NAME == null ? that.PARTNER_DEALER_NAME == null : this.PARTNER_DEALER_NAME.equals(that.PARTNER_DEALER_NAME));
    equal = equal && (this.BG_CODE == null ? that.BG_CODE == null : this.BG_CODE.equals(that.BG_CODE));
    equal = equal && (this.BG_NAME == null ? that.BG_NAME == null : this.BG_NAME.equals(that.BG_NAME));
    equal = equal && (this.BG_AREA_NAME == null ? that.BG_AREA_NAME == null : this.BG_AREA_NAME.equals(that.BG_AREA_NAME));
    equal = equal && (this.BG_REGION_NAME == null ? that.BG_REGION_NAME == null : this.BG_REGION_NAME.equals(that.BG_REGION_NAME));
    equal = equal && (this.BG_CITY_GROUP_NAME == null ? that.BG_CITY_GROUP_NAME == null : this.BG_CITY_GROUP_NAME.equals(that.BG_CITY_GROUP_NAME));
    equal = equal && (this.BG_CITY_NAME == null ? that.BG_CITY_NAME == null : this.BG_CITY_NAME.equals(that.BG_CITY_NAME));
    equal = equal && (this.WAREHOUSE_NAME == null ? that.WAREHOUSE_NAME == null : this.WAREHOUSE_NAME.equals(that.WAREHOUSE_NAME));
    equal = equal && (this.PROVINCE_NAME == null ? that.PROVINCE_NAME == null : this.PROVINCE_NAME.equals(that.PROVINCE_NAME));
    equal = equal && (this.CITY_NAME == null ? that.CITY_NAME == null : this.CITY_NAME.equals(that.CITY_NAME));
    equal = equal && (this.COUNTY_NAME == null ? that.COUNTY_NAME == null : this.COUNTY_NAME.equals(that.COUNTY_NAME));
    equal = equal && (this.RESPONSIBLE_NAME == null ? that.RESPONSIBLE_NAME == null : this.RESPONSIBLE_NAME.equals(that.RESPONSIBLE_NAME));
    equal = equal && (this.RESPONSIBLE_PHONE == null ? that.RESPONSIBLE_PHONE == null : this.RESPONSIBLE_PHONE.equals(that.RESPONSIBLE_PHONE));
    equal = equal && (this.EMAIL_ADDR == null ? that.EMAIL_ADDR == null : this.EMAIL_ADDR.equals(that.EMAIL_ADDR));
    equal = equal && (this.OFFICE_ADDR == null ? that.OFFICE_ADDR == null : this.OFFICE_ADDR.equals(that.OFFICE_ADDR));
    equal = equal && (this.RECEIVE_ADDR == null ? that.RECEIVE_ADDR == null : this.RECEIVE_ADDR.equals(that.RECEIVE_ADDR));
    equal = equal && (this.RECEIVE_NAME == null ? that.RECEIVE_NAME == null : this.RECEIVE_NAME.equals(that.RECEIVE_NAME));
    equal = equal && (this.RECEIVE_PHONE == null ? that.RECEIVE_PHONE == null : this.RECEIVE_PHONE.equals(that.RECEIVE_PHONE));
    equal = equal && (this.DEALER_TYPE == null ? that.DEALER_TYPE == null : this.DEALER_TYPE.equals(that.DEALER_TYPE));
    equal = equal && (this.DEALER_LEVEL == null ? that.DEALER_LEVEL == null : this.DEALER_LEVEL.equals(that.DEALER_LEVEL));
    equal = equal && (this.CHANNEL_TYPE == null ? that.CHANNEL_TYPE == null : this.CHANNEL_TYPE.equals(that.CHANNEL_TYPE));
    equal = equal && (this.CREATED_BY_ID == null ? that.CREATED_BY_ID == null : this.CREATED_BY_ID.equals(that.CREATED_BY_ID));
    equal = equal && (this.CHANGED_BY_ID == null ? that.CHANGED_BY_ID == null : this.CHANGED_BY_ID.equals(that.CHANGED_BY_ID));
    equal = equal && (this.CREATED_ON_DT == null ? that.CREATED_ON_DT == null : this.CREATED_ON_DT.equals(that.CREATED_ON_DT));
    equal = equal && (this.CHANGED_ON_DT == null ? that.CHANGED_ON_DT == null : this.CHANGED_ON_DT.equals(that.CHANGED_ON_DT));
    equal = equal && (this.AUX1_CHANGED_ON_DT == null ? that.AUX1_CHANGED_ON_DT == null : this.AUX1_CHANGED_ON_DT.equals(that.AUX1_CHANGED_ON_DT));
    equal = equal && (this.AUX2_CHANGED_ON_DT == null ? that.AUX2_CHANGED_ON_DT == null : this.AUX2_CHANGED_ON_DT.equals(that.AUX2_CHANGED_ON_DT));
    equal = equal && (this.AUX3_CHANGED_ON_DT == null ? that.AUX3_CHANGED_ON_DT == null : this.AUX3_CHANGED_ON_DT.equals(that.AUX3_CHANGED_ON_DT));
    equal = equal && (this.AUX4_CHANGED_ON_DT == null ? that.AUX4_CHANGED_ON_DT == null : this.AUX4_CHANGED_ON_DT.equals(that.AUX4_CHANGED_ON_DT));
    equal = equal && (this.W_INSERT_DT == null ? that.W_INSERT_DT == null : this.W_INSERT_DT.equals(that.W_INSERT_DT));
    equal = equal && (this.W_UPDATE_DT == null ? that.W_UPDATE_DT == null : this.W_UPDATE_DT.equals(that.W_UPDATE_DT));
    equal = equal && (this.ETL_PROC_WID == null ? that.ETL_PROC_WID == null : this.ETL_PROC_WID.equals(that.ETL_PROC_WID));
    equal = equal && (this.DATE_FROM == null ? that.DATE_FROM == null : this.DATE_FROM.equals(that.DATE_FROM));
    equal = equal && (this.DATE_TO == null ? that.DATE_TO == null : this.DATE_TO.equals(that.DATE_TO));
    equal = equal && (this.VERSION == null ? that.VERSION == null : this.VERSION.equals(that.VERSION));
    equal = equal && (this.ROW_ID == null ? that.ROW_ID == null : this.ROW_ID.equals(that.ROW_ID));
    equal = equal && (this.DEALER_ERP_CODE == null ? that.DEALER_ERP_CODE == null : this.DEALER_ERP_CODE.equals(that.DEALER_ERP_CODE));
    equal = equal && (this.DATASOURCE_ID == null ? that.DATASOURCE_ID == null : this.DATASOURCE_ID.equals(that.DATASOURCE_ID));
    equal = equal && (this.AREA_CODE == null ? that.AREA_CODE == null : this.AREA_CODE.equals(that.AREA_CODE));
    equal = equal && (this.SALE_TYPE == null ? that.SALE_TYPE == null : this.SALE_TYPE.equals(that.SALE_TYPE));
    equal = equal && (this.IS_WAREHOUSE_CUSTOMER == null ? that.IS_WAREHOUSE_CUSTOMER == null : this.IS_WAREHOUSE_CUSTOMER.equals(that.IS_WAREHOUSE_CUSTOMER));
    equal = equal && (this.TEST_FLG == null ? that.TEST_FLG == null : this.TEST_FLG.equals(that.TEST_FLG));
    equal = equal && (this.STATUS == null ? that.STATUS == null : this.STATUS.equals(that.STATUS));
    return equal;
  }
  public void readFields(ResultSet __dbResults) throws SQLException {
    this.__cur_result_set = __dbResults;
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(1, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.DEALER_CODE = JdbcWritableBridge.readString(3, __dbResults);
    this.DEALER_NAME = JdbcWritableBridge.readString(4, __dbResults);
    this.DEALER_SHORT_NAME = JdbcWritableBridge.readString(5, __dbResults);
    this.PARTNER_DEALER_CODE = JdbcWritableBridge.readString(6, __dbResults);
    this.PARTNER_DEALER_NAME = JdbcWritableBridge.readString(7, __dbResults);
    this.BG_CODE = JdbcWritableBridge.readString(8, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(9, __dbResults);
    this.BG_AREA_NAME = JdbcWritableBridge.readString(10, __dbResults);
    this.BG_REGION_NAME = JdbcWritableBridge.readString(11, __dbResults);
    this.BG_CITY_GROUP_NAME = JdbcWritableBridge.readString(12, __dbResults);
    this.BG_CITY_NAME = JdbcWritableBridge.readString(13, __dbResults);
    this.WAREHOUSE_NAME = JdbcWritableBridge.readString(14, __dbResults);
    this.PROVINCE_NAME = JdbcWritableBridge.readString(15, __dbResults);
    this.CITY_NAME = JdbcWritableBridge.readString(16, __dbResults);
    this.COUNTY_NAME = JdbcWritableBridge.readString(17, __dbResults);
    this.RESPONSIBLE_NAME = JdbcWritableBridge.readString(18, __dbResults);
    this.RESPONSIBLE_PHONE = JdbcWritableBridge.readString(19, __dbResults);
    this.EMAIL_ADDR = JdbcWritableBridge.readString(20, __dbResults);
    this.OFFICE_ADDR = JdbcWritableBridge.readString(21, __dbResults);
    this.RECEIVE_ADDR = JdbcWritableBridge.readString(22, __dbResults);
    this.RECEIVE_NAME = JdbcWritableBridge.readString(23, __dbResults);
    this.RECEIVE_PHONE = JdbcWritableBridge.readString(24, __dbResults);
    this.DEALER_TYPE = JdbcWritableBridge.readString(25, __dbResults);
    this.DEALER_LEVEL = JdbcWritableBridge.readString(26, __dbResults);
    this.CHANNEL_TYPE = JdbcWritableBridge.readString(27, __dbResults);
    this.CREATED_BY_ID = JdbcWritableBridge.readString(28, __dbResults);
    this.CHANGED_BY_ID = JdbcWritableBridge.readString(29, __dbResults);
    this.CREATED_ON_DT = JdbcWritableBridge.readTimestamp(30, __dbResults);
    this.CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(31, __dbResults);
    this.AUX1_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(32, __dbResults);
    this.AUX2_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(33, __dbResults);
    this.AUX3_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(34, __dbResults);
    this.AUX4_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(35, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(36, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(37, __dbResults);
    this.ETL_PROC_WID = JdbcWritableBridge.readBigDecimal(38, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(39, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(40, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(41, __dbResults);
    this.ROW_ID = JdbcWritableBridge.readString(42, __dbResults);
    this.DEALER_ERP_CODE = JdbcWritableBridge.readString(43, __dbResults);
    this.DATASOURCE_ID = JdbcWritableBridge.readString(44, __dbResults);
    this.AREA_CODE = JdbcWritableBridge.readString(45, __dbResults);
    this.SALE_TYPE = JdbcWritableBridge.readString(46, __dbResults);
    this.IS_WAREHOUSE_CUSTOMER = JdbcWritableBridge.readString(47, __dbResults);
    this.TEST_FLG = JdbcWritableBridge.readString(48, __dbResults);
    this.STATUS = JdbcWritableBridge.readString(49, __dbResults);
  }
  public void readFields0(ResultSet __dbResults) throws SQLException {
    this.ROW_WID = JdbcWritableBridge.readBigDecimal(1, __dbResults);
    this.INTEGRATION_ID = JdbcWritableBridge.readString(2, __dbResults);
    this.DEALER_CODE = JdbcWritableBridge.readString(3, __dbResults);
    this.DEALER_NAME = JdbcWritableBridge.readString(4, __dbResults);
    this.DEALER_SHORT_NAME = JdbcWritableBridge.readString(5, __dbResults);
    this.PARTNER_DEALER_CODE = JdbcWritableBridge.readString(6, __dbResults);
    this.PARTNER_DEALER_NAME = JdbcWritableBridge.readString(7, __dbResults);
    this.BG_CODE = JdbcWritableBridge.readString(8, __dbResults);
    this.BG_NAME = JdbcWritableBridge.readString(9, __dbResults);
    this.BG_AREA_NAME = JdbcWritableBridge.readString(10, __dbResults);
    this.BG_REGION_NAME = JdbcWritableBridge.readString(11, __dbResults);
    this.BG_CITY_GROUP_NAME = JdbcWritableBridge.readString(12, __dbResults);
    this.BG_CITY_NAME = JdbcWritableBridge.readString(13, __dbResults);
    this.WAREHOUSE_NAME = JdbcWritableBridge.readString(14, __dbResults);
    this.PROVINCE_NAME = JdbcWritableBridge.readString(15, __dbResults);
    this.CITY_NAME = JdbcWritableBridge.readString(16, __dbResults);
    this.COUNTY_NAME = JdbcWritableBridge.readString(17, __dbResults);
    this.RESPONSIBLE_NAME = JdbcWritableBridge.readString(18, __dbResults);
    this.RESPONSIBLE_PHONE = JdbcWritableBridge.readString(19, __dbResults);
    this.EMAIL_ADDR = JdbcWritableBridge.readString(20, __dbResults);
    this.OFFICE_ADDR = JdbcWritableBridge.readString(21, __dbResults);
    this.RECEIVE_ADDR = JdbcWritableBridge.readString(22, __dbResults);
    this.RECEIVE_NAME = JdbcWritableBridge.readString(23, __dbResults);
    this.RECEIVE_PHONE = JdbcWritableBridge.readString(24, __dbResults);
    this.DEALER_TYPE = JdbcWritableBridge.readString(25, __dbResults);
    this.DEALER_LEVEL = JdbcWritableBridge.readString(26, __dbResults);
    this.CHANNEL_TYPE = JdbcWritableBridge.readString(27, __dbResults);
    this.CREATED_BY_ID = JdbcWritableBridge.readString(28, __dbResults);
    this.CHANGED_BY_ID = JdbcWritableBridge.readString(29, __dbResults);
    this.CREATED_ON_DT = JdbcWritableBridge.readTimestamp(30, __dbResults);
    this.CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(31, __dbResults);
    this.AUX1_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(32, __dbResults);
    this.AUX2_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(33, __dbResults);
    this.AUX3_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(34, __dbResults);
    this.AUX4_CHANGED_ON_DT = JdbcWritableBridge.readTimestamp(35, __dbResults);
    this.W_INSERT_DT = JdbcWritableBridge.readTimestamp(36, __dbResults);
    this.W_UPDATE_DT = JdbcWritableBridge.readTimestamp(37, __dbResults);
    this.ETL_PROC_WID = JdbcWritableBridge.readBigDecimal(38, __dbResults);
    this.DATE_FROM = JdbcWritableBridge.readTimestamp(39, __dbResults);
    this.DATE_TO = JdbcWritableBridge.readTimestamp(40, __dbResults);
    this.VERSION = JdbcWritableBridge.readBigDecimal(41, __dbResults);
    this.ROW_ID = JdbcWritableBridge.readString(42, __dbResults);
    this.DEALER_ERP_CODE = JdbcWritableBridge.readString(43, __dbResults);
    this.DATASOURCE_ID = JdbcWritableBridge.readString(44, __dbResults);
    this.AREA_CODE = JdbcWritableBridge.readString(45, __dbResults);
    this.SALE_TYPE = JdbcWritableBridge.readString(46, __dbResults);
    this.IS_WAREHOUSE_CUSTOMER = JdbcWritableBridge.readString(47, __dbResults);
    this.TEST_FLG = JdbcWritableBridge.readString(48, __dbResults);
    this.STATUS = JdbcWritableBridge.readString(49, __dbResults);
  }
  public void loadLargeObjects(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void loadLargeObjects0(LargeObjectLoader __loader)
      throws SQLException, IOException, InterruptedException {
  }
  public void write(PreparedStatement __dbStmt) throws SQLException {
    write(__dbStmt, 0);
  }

  public int write(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 1 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_CODE, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_NAME, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_SHORT_NAME, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PARTNER_DEALER_CODE, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PARTNER_DEALER_NAME, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CODE, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_AREA_NAME, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_REGION_NAME, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CITY_GROUP_NAME, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CITY_NAME, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WAREHOUSE_NAME, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PROVINCE_NAME, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CITY_NAME, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(COUNTY_NAME, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RESPONSIBLE_NAME, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RESPONSIBLE_PHONE, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(EMAIL_ADDR, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(OFFICE_ADDR, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_ADDR, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_NAME, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_PHONE, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_TYPE, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_LEVEL, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CHANNEL_TYPE, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CREATED_BY_ID, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CHANGED_BY_ID, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATED_ON_DT, 30 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CHANGED_ON_DT, 31 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX1_CHANGED_ON_DT, 32 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX2_CHANGED_ON_DT, 33 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX3_CHANGED_ON_DT, 34 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX4_CHANGED_ON_DT, 35 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 36 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 37 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ETL_PROC_WID, 38 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 39 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 40 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 41 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ROW_ID, 42 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_ERP_CODE, 43 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DATASOURCE_ID, 44 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(AREA_CODE, 45 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(SALE_TYPE, 46 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(IS_WAREHOUSE_CUSTOMER, 47 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(TEST_FLG, 48 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(STATUS, 49 + __off, 12, __dbStmt);
    return 49;
  }
  public void write0(PreparedStatement __dbStmt, int __off) throws SQLException {
    JdbcWritableBridge.writeBigDecimal(ROW_WID, 1 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(INTEGRATION_ID, 2 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_CODE, 3 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_NAME, 4 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_SHORT_NAME, 5 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PARTNER_DEALER_CODE, 6 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PARTNER_DEALER_NAME, 7 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CODE, 8 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_NAME, 9 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_AREA_NAME, 10 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_REGION_NAME, 11 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CITY_GROUP_NAME, 12 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(BG_CITY_NAME, 13 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(WAREHOUSE_NAME, 14 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(PROVINCE_NAME, 15 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CITY_NAME, 16 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(COUNTY_NAME, 17 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RESPONSIBLE_NAME, 18 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RESPONSIBLE_PHONE, 19 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(EMAIL_ADDR, 20 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(OFFICE_ADDR, 21 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_ADDR, 22 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_NAME, 23 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(RECEIVE_PHONE, 24 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_TYPE, 25 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_LEVEL, 26 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CHANNEL_TYPE, 27 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CREATED_BY_ID, 28 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(CHANGED_BY_ID, 29 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CREATED_ON_DT, 30 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(CHANGED_ON_DT, 31 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX1_CHANGED_ON_DT, 32 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX2_CHANGED_ON_DT, 33 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX3_CHANGED_ON_DT, 34 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(AUX4_CHANGED_ON_DT, 35 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_INSERT_DT, 36 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(W_UPDATE_DT, 37 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(ETL_PROC_WID, 38 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_FROM, 39 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeTimestamp(DATE_TO, 40 + __off, 93, __dbStmt);
    JdbcWritableBridge.writeBigDecimal(VERSION, 41 + __off, 2, __dbStmt);
    JdbcWritableBridge.writeString(ROW_ID, 42 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DEALER_ERP_CODE, 43 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(DATASOURCE_ID, 44 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(AREA_CODE, 45 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(SALE_TYPE, 46 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(IS_WAREHOUSE_CUSTOMER, 47 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(TEST_FLG, 48 + __off, 12, __dbStmt);
    JdbcWritableBridge.writeString(STATUS, 49 + __off, 12, __dbStmt);
  }
  public void readFields(DataInput __dataIn) throws IOException {
this.readFields0(__dataIn);  }
  public void readFields0(DataInput __dataIn) throws IOException {
    if (__dataIn.readBoolean()) { 
        this.ROW_WID = null;
    } else {
    this.ROW_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.INTEGRATION_ID = null;
    } else {
    this.INTEGRATION_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_CODE = null;
    } else {
    this.DEALER_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_NAME = null;
    } else {
    this.DEALER_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_SHORT_NAME = null;
    } else {
    this.DEALER_SHORT_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PARTNER_DEALER_CODE = null;
    } else {
    this.PARTNER_DEALER_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PARTNER_DEALER_NAME = null;
    } else {
    this.PARTNER_DEALER_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_CODE = null;
    } else {
    this.BG_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_NAME = null;
    } else {
    this.BG_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_AREA_NAME = null;
    } else {
    this.BG_AREA_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_REGION_NAME = null;
    } else {
    this.BG_REGION_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_CITY_GROUP_NAME = null;
    } else {
    this.BG_CITY_GROUP_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.BG_CITY_NAME = null;
    } else {
    this.BG_CITY_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.WAREHOUSE_NAME = null;
    } else {
    this.WAREHOUSE_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.PROVINCE_NAME = null;
    } else {
    this.PROVINCE_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CITY_NAME = null;
    } else {
    this.CITY_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.COUNTY_NAME = null;
    } else {
    this.COUNTY_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.RESPONSIBLE_NAME = null;
    } else {
    this.RESPONSIBLE_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.RESPONSIBLE_PHONE = null;
    } else {
    this.RESPONSIBLE_PHONE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.EMAIL_ADDR = null;
    } else {
    this.EMAIL_ADDR = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.OFFICE_ADDR = null;
    } else {
    this.OFFICE_ADDR = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.RECEIVE_ADDR = null;
    } else {
    this.RECEIVE_ADDR = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.RECEIVE_NAME = null;
    } else {
    this.RECEIVE_NAME = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.RECEIVE_PHONE = null;
    } else {
    this.RECEIVE_PHONE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_TYPE = null;
    } else {
    this.DEALER_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_LEVEL = null;
    } else {
    this.DEALER_LEVEL = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CHANNEL_TYPE = null;
    } else {
    this.CHANNEL_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CREATED_BY_ID = null;
    } else {
    this.CREATED_BY_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CHANGED_BY_ID = null;
    } else {
    this.CHANGED_BY_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.CREATED_ON_DT = null;
    } else {
    this.CREATED_ON_DT = new Timestamp(__dataIn.readLong());
    this.CREATED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.CHANGED_ON_DT = null;
    } else {
    this.CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AUX1_CHANGED_ON_DT = null;
    } else {
    this.AUX1_CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.AUX1_CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AUX2_CHANGED_ON_DT = null;
    } else {
    this.AUX2_CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.AUX2_CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AUX3_CHANGED_ON_DT = null;
    } else {
    this.AUX3_CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.AUX3_CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.AUX4_CHANGED_ON_DT = null;
    } else {
    this.AUX4_CHANGED_ON_DT = new Timestamp(__dataIn.readLong());
    this.AUX4_CHANGED_ON_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.W_INSERT_DT = null;
    } else {
    this.W_INSERT_DT = new Timestamp(__dataIn.readLong());
    this.W_INSERT_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.W_UPDATE_DT = null;
    } else {
    this.W_UPDATE_DT = new Timestamp(__dataIn.readLong());
    this.W_UPDATE_DT.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.ETL_PROC_WID = null;
    } else {
    this.ETL_PROC_WID = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_FROM = null;
    } else {
    this.DATE_FROM = new Timestamp(__dataIn.readLong());
    this.DATE_FROM.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.DATE_TO = null;
    } else {
    this.DATE_TO = new Timestamp(__dataIn.readLong());
    this.DATE_TO.setNanos(__dataIn.readInt());
    }
    if (__dataIn.readBoolean()) { 
        this.VERSION = null;
    } else {
    this.VERSION = com.cloudera.sqoop.lib.BigDecimalSerializer.readFields(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.ROW_ID = null;
    } else {
    this.ROW_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DEALER_ERP_CODE = null;
    } else {
    this.DEALER_ERP_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.DATASOURCE_ID = null;
    } else {
    this.DATASOURCE_ID = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.AREA_CODE = null;
    } else {
    this.AREA_CODE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.SALE_TYPE = null;
    } else {
    this.SALE_TYPE = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.IS_WAREHOUSE_CUSTOMER = null;
    } else {
    this.IS_WAREHOUSE_CUSTOMER = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.TEST_FLG = null;
    } else {
    this.TEST_FLG = Text.readString(__dataIn);
    }
    if (__dataIn.readBoolean()) { 
        this.STATUS = null;
    } else {
    this.STATUS = Text.readString(__dataIn);
    }
  }
  public void write(DataOutput __dataOut) throws IOException {
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_CODE);
    }
    if (null == this.DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_NAME);
    }
    if (null == this.DEALER_SHORT_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_SHORT_NAME);
    }
    if (null == this.PARTNER_DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARTNER_DEALER_CODE);
    }
    if (null == this.PARTNER_DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARTNER_DEALER_NAME);
    }
    if (null == this.BG_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CODE);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.BG_AREA_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_AREA_NAME);
    }
    if (null == this.BG_REGION_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_REGION_NAME);
    }
    if (null == this.BG_CITY_GROUP_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CITY_GROUP_NAME);
    }
    if (null == this.BG_CITY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CITY_NAME);
    }
    if (null == this.WAREHOUSE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WAREHOUSE_NAME);
    }
    if (null == this.PROVINCE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PROVINCE_NAME);
    }
    if (null == this.CITY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CITY_NAME);
    }
    if (null == this.COUNTY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, COUNTY_NAME);
    }
    if (null == this.RESPONSIBLE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RESPONSIBLE_NAME);
    }
    if (null == this.RESPONSIBLE_PHONE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RESPONSIBLE_PHONE);
    }
    if (null == this.EMAIL_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, EMAIL_ADDR);
    }
    if (null == this.OFFICE_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, OFFICE_ADDR);
    }
    if (null == this.RECEIVE_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_ADDR);
    }
    if (null == this.RECEIVE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_NAME);
    }
    if (null == this.RECEIVE_PHONE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_PHONE);
    }
    if (null == this.DEALER_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_TYPE);
    }
    if (null == this.DEALER_LEVEL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_LEVEL);
    }
    if (null == this.CHANNEL_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CHANNEL_TYPE);
    }
    if (null == this.CREATED_BY_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CREATED_BY_ID);
    }
    if (null == this.CHANGED_BY_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CHANGED_BY_ID);
    }
    if (null == this.CREATED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATED_ON_DT.getTime());
    __dataOut.writeInt(this.CREATED_ON_DT.getNanos());
    }
    if (null == this.CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX1_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX1_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX1_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX2_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX2_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX2_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX3_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX3_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX3_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX4_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX4_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX4_CHANGED_ON_DT.getNanos());
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.W_UPDATE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_UPDATE_DT.getTime());
    __dataOut.writeInt(this.W_UPDATE_DT.getNanos());
    }
    if (null == this.ETL_PROC_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ETL_PROC_WID, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.ROW_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ROW_ID);
    }
    if (null == this.DEALER_ERP_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_ERP_CODE);
    }
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
    }
    if (null == this.AREA_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, AREA_CODE);
    }
    if (null == this.SALE_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SALE_TYPE);
    }
    if (null == this.IS_WAREHOUSE_CUSTOMER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, IS_WAREHOUSE_CUSTOMER);
    }
    if (null == this.TEST_FLG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, TEST_FLG);
    }
    if (null == this.STATUS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATUS);
    }
  }
  public void write0(DataOutput __dataOut) throws IOException {
    if (null == this.ROW_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ROW_WID, __dataOut);
    }
    if (null == this.INTEGRATION_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, INTEGRATION_ID);
    }
    if (null == this.DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_CODE);
    }
    if (null == this.DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_NAME);
    }
    if (null == this.DEALER_SHORT_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_SHORT_NAME);
    }
    if (null == this.PARTNER_DEALER_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARTNER_DEALER_CODE);
    }
    if (null == this.PARTNER_DEALER_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PARTNER_DEALER_NAME);
    }
    if (null == this.BG_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CODE);
    }
    if (null == this.BG_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_NAME);
    }
    if (null == this.BG_AREA_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_AREA_NAME);
    }
    if (null == this.BG_REGION_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_REGION_NAME);
    }
    if (null == this.BG_CITY_GROUP_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CITY_GROUP_NAME);
    }
    if (null == this.BG_CITY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, BG_CITY_NAME);
    }
    if (null == this.WAREHOUSE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, WAREHOUSE_NAME);
    }
    if (null == this.PROVINCE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, PROVINCE_NAME);
    }
    if (null == this.CITY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CITY_NAME);
    }
    if (null == this.COUNTY_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, COUNTY_NAME);
    }
    if (null == this.RESPONSIBLE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RESPONSIBLE_NAME);
    }
    if (null == this.RESPONSIBLE_PHONE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RESPONSIBLE_PHONE);
    }
    if (null == this.EMAIL_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, EMAIL_ADDR);
    }
    if (null == this.OFFICE_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, OFFICE_ADDR);
    }
    if (null == this.RECEIVE_ADDR) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_ADDR);
    }
    if (null == this.RECEIVE_NAME) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_NAME);
    }
    if (null == this.RECEIVE_PHONE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, RECEIVE_PHONE);
    }
    if (null == this.DEALER_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_TYPE);
    }
    if (null == this.DEALER_LEVEL) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_LEVEL);
    }
    if (null == this.CHANNEL_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CHANNEL_TYPE);
    }
    if (null == this.CREATED_BY_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CREATED_BY_ID);
    }
    if (null == this.CHANGED_BY_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, CHANGED_BY_ID);
    }
    if (null == this.CREATED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CREATED_ON_DT.getTime());
    __dataOut.writeInt(this.CREATED_ON_DT.getNanos());
    }
    if (null == this.CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX1_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX1_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX1_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX2_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX2_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX2_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX3_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX3_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX3_CHANGED_ON_DT.getNanos());
    }
    if (null == this.AUX4_CHANGED_ON_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.AUX4_CHANGED_ON_DT.getTime());
    __dataOut.writeInt(this.AUX4_CHANGED_ON_DT.getNanos());
    }
    if (null == this.W_INSERT_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_INSERT_DT.getTime());
    __dataOut.writeInt(this.W_INSERT_DT.getNanos());
    }
    if (null == this.W_UPDATE_DT) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.W_UPDATE_DT.getTime());
    __dataOut.writeInt(this.W_UPDATE_DT.getNanos());
    }
    if (null == this.ETL_PROC_WID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.ETL_PROC_WID, __dataOut);
    }
    if (null == this.DATE_FROM) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_FROM.getTime());
    __dataOut.writeInt(this.DATE_FROM.getNanos());
    }
    if (null == this.DATE_TO) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    __dataOut.writeLong(this.DATE_TO.getTime());
    __dataOut.writeInt(this.DATE_TO.getNanos());
    }
    if (null == this.VERSION) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    com.cloudera.sqoop.lib.BigDecimalSerializer.write(this.VERSION, __dataOut);
    }
    if (null == this.ROW_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, ROW_ID);
    }
    if (null == this.DEALER_ERP_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DEALER_ERP_CODE);
    }
    if (null == this.DATASOURCE_ID) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, DATASOURCE_ID);
    }
    if (null == this.AREA_CODE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, AREA_CODE);
    }
    if (null == this.SALE_TYPE) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, SALE_TYPE);
    }
    if (null == this.IS_WAREHOUSE_CUSTOMER) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, IS_WAREHOUSE_CUSTOMER);
    }
    if (null == this.TEST_FLG) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, TEST_FLG);
    }
    if (null == this.STATUS) { 
        __dataOut.writeBoolean(true);
    } else {
        __dataOut.writeBoolean(false);
    Text.writeString(__dataOut, STATUS);
    }
  }
  private static final DelimiterSet __outputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  public String toString() {
    return toString(__outputDelimiters, true);
  }
  public String toString(DelimiterSet delimiters) {
    return toString(delimiters, true);
  }
  public String toString(boolean useRecordDelim) {
    return toString(__outputDelimiters, useRecordDelim);
  }
  public String toString(DelimiterSet delimiters, boolean useRecordDelim) {
    StringBuilder __sb = new StringBuilder();
    char fieldDelim = delimiters.getFieldsTerminatedBy();
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_CODE==null?"null":DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_NAME==null?"null":DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_SHORT_NAME==null?"null":DEALER_SHORT_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARTNER_DEALER_CODE==null?"null":PARTNER_DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARTNER_DEALER_NAME==null?"null":PARTNER_DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CODE==null?"null":BG_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_AREA_NAME==null?"null":BG_AREA_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_REGION_NAME==null?"null":BG_REGION_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CITY_GROUP_NAME==null?"null":BG_CITY_GROUP_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CITY_NAME==null?"null":BG_CITY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WAREHOUSE_NAME==null?"null":WAREHOUSE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PROVINCE_NAME==null?"null":PROVINCE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CITY_NAME==null?"null":CITY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(COUNTY_NAME==null?"null":COUNTY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RESPONSIBLE_NAME==null?"null":RESPONSIBLE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RESPONSIBLE_PHONE==null?"null":RESPONSIBLE_PHONE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(EMAIL_ADDR==null?"null":EMAIL_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(OFFICE_ADDR==null?"null":OFFICE_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_ADDR==null?"null":RECEIVE_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_NAME==null?"null":RECEIVE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_PHONE==null?"null":RECEIVE_PHONE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_TYPE==null?"null":DEALER_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_LEVEL==null?"null":DEALER_LEVEL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANNEL_TYPE==null?"null":CHANNEL_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_BY_ID==null?"null":CREATED_BY_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_BY_ID==null?"null":CHANGED_BY_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_ON_DT==null?"null":"" + CREATED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_ON_DT==null?"null":"" + CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX1_CHANGED_ON_DT==null?"null":"" + AUX1_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX2_CHANGED_ON_DT==null?"null":"" + AUX2_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX3_CHANGED_ON_DT==null?"null":"" + AUX3_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX4_CHANGED_ON_DT==null?"null":"" + AUX4_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"null":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ETL_PROC_WID==null?"null":ETL_PROC_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_ID==null?"null":ROW_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_ERP_CODE==null?"null":DEALER_ERP_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_CODE==null?"null":AREA_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SALE_TYPE==null?"null":SALE_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(IS_WAREHOUSE_CUSTOMER==null?"null":IS_WAREHOUSE_CUSTOMER, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TEST_FLG==null?"null":TEST_FLG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATUS==null?"null":STATUS, delimiters));
    if (useRecordDelim) {
      __sb.append(delimiters.getLinesTerminatedBy());
    }
    return __sb.toString();
  }
  public void toString0(DelimiterSet delimiters, StringBuilder __sb, char fieldDelim) {
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_WID==null?"null":ROW_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(INTEGRATION_ID==null?"null":INTEGRATION_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_CODE==null?"null":DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_NAME==null?"null":DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_SHORT_NAME==null?"null":DEALER_SHORT_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARTNER_DEALER_CODE==null?"null":PARTNER_DEALER_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PARTNER_DEALER_NAME==null?"null":PARTNER_DEALER_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CODE==null?"null":BG_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_NAME==null?"null":BG_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_AREA_NAME==null?"null":BG_AREA_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_REGION_NAME==null?"null":BG_REGION_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CITY_GROUP_NAME==null?"null":BG_CITY_GROUP_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(BG_CITY_NAME==null?"null":BG_CITY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(WAREHOUSE_NAME==null?"null":WAREHOUSE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(PROVINCE_NAME==null?"null":PROVINCE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CITY_NAME==null?"null":CITY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(COUNTY_NAME==null?"null":COUNTY_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RESPONSIBLE_NAME==null?"null":RESPONSIBLE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RESPONSIBLE_PHONE==null?"null":RESPONSIBLE_PHONE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(EMAIL_ADDR==null?"null":EMAIL_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(OFFICE_ADDR==null?"null":OFFICE_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_ADDR==null?"null":RECEIVE_ADDR, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_NAME==null?"null":RECEIVE_NAME, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(RECEIVE_PHONE==null?"null":RECEIVE_PHONE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_TYPE==null?"null":DEALER_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_LEVEL==null?"null":DEALER_LEVEL, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANNEL_TYPE==null?"null":CHANNEL_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_BY_ID==null?"null":CREATED_BY_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_BY_ID==null?"null":CHANGED_BY_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CREATED_ON_DT==null?"null":"" + CREATED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(CHANGED_ON_DT==null?"null":"" + CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX1_CHANGED_ON_DT==null?"null":"" + AUX1_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX2_CHANGED_ON_DT==null?"null":"" + AUX2_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX3_CHANGED_ON_DT==null?"null":"" + AUX3_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AUX4_CHANGED_ON_DT==null?"null":"" + AUX4_CHANGED_ON_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_INSERT_DT==null?"null":"" + W_INSERT_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(W_UPDATE_DT==null?"null":"" + W_UPDATE_DT, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ETL_PROC_WID==null?"null":ETL_PROC_WID.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_FROM==null?"null":"" + DATE_FROM, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATE_TO==null?"null":"" + DATE_TO, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(VERSION==null?"null":VERSION.toPlainString(), delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(ROW_ID==null?"null":ROW_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DEALER_ERP_CODE==null?"null":DEALER_ERP_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(DATASOURCE_ID==null?"null":DATASOURCE_ID, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(AREA_CODE==null?"null":AREA_CODE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(SALE_TYPE==null?"null":SALE_TYPE, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(IS_WAREHOUSE_CUSTOMER==null?"null":IS_WAREHOUSE_CUSTOMER, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(TEST_FLG==null?"null":TEST_FLG, delimiters));
    __sb.append(fieldDelim);
    __sb.append(FieldFormatter.escapeAndEnclose(STATUS==null?"null":STATUS, delimiters));
  }
  private static final DelimiterSet __inputDelimiters = new DelimiterSet((char) 44, (char) 10, (char) 0, (char) 0, false);
  private RecordParser __parser;
  public void parse(Text __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharSequence __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(byte [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(char [] __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(ByteBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  public void parse(CharBuffer __record) throws RecordParser.ParseError {
    if (null == this.__parser) {
      this.__parser = new RecordParser(__inputDelimiters);
    }
    List<String> __fields = this.__parser.parseRecord(__record);
    __loadFromFields(__fields);
  }

  private void __loadFromFields(List<String> fields) {
    Iterator<String> __it = fields.listIterator();
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_CODE = null; } else {
      this.DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_NAME = null; } else {
      this.DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_SHORT_NAME = null; } else {
      this.DEALER_SHORT_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARTNER_DEALER_CODE = null; } else {
      this.PARTNER_DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARTNER_DEALER_NAME = null; } else {
      this.PARTNER_DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CODE = null; } else {
      this.BG_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_AREA_NAME = null; } else {
      this.BG_AREA_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_REGION_NAME = null; } else {
      this.BG_REGION_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CITY_GROUP_NAME = null; } else {
      this.BG_CITY_GROUP_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CITY_NAME = null; } else {
      this.BG_CITY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WAREHOUSE_NAME = null; } else {
      this.WAREHOUSE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PROVINCE_NAME = null; } else {
      this.PROVINCE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CITY_NAME = null; } else {
      this.CITY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.COUNTY_NAME = null; } else {
      this.COUNTY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RESPONSIBLE_NAME = null; } else {
      this.RESPONSIBLE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RESPONSIBLE_PHONE = null; } else {
      this.RESPONSIBLE_PHONE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.EMAIL_ADDR = null; } else {
      this.EMAIL_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.OFFICE_ADDR = null; } else {
      this.OFFICE_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_ADDR = null; } else {
      this.RECEIVE_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_NAME = null; } else {
      this.RECEIVE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_PHONE = null; } else {
      this.RECEIVE_PHONE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_TYPE = null; } else {
      this.DEALER_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_LEVEL = null; } else {
      this.DEALER_LEVEL = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CHANNEL_TYPE = null; } else {
      this.CHANNEL_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CREATED_BY_ID = null; } else {
      this.CREATED_BY_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CHANGED_BY_ID = null; } else {
      this.CHANGED_BY_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATED_ON_DT = null; } else {
      this.CREATED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CHANGED_ON_DT = null; } else {
      this.CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX1_CHANGED_ON_DT = null; } else {
      this.AUX1_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX2_CHANGED_ON_DT = null; } else {
      this.AUX2_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX3_CHANGED_ON_DT = null; } else {
      this.AUX3_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX4_CHANGED_ON_DT = null; } else {
      this.AUX4_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ETL_PROC_WID = null; } else {
      this.ETL_PROC_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ROW_ID = null; } else {
      this.ROW_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_ERP_CODE = null; } else {
      this.DEALER_ERP_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.AREA_CODE = null; } else {
      this.AREA_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SALE_TYPE = null; } else {
      this.SALE_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.IS_WAREHOUSE_CUSTOMER = null; } else {
      this.IS_WAREHOUSE_CUSTOMER = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.TEST_FLG = null; } else {
      this.TEST_FLG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATUS = null; } else {
      this.STATUS = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  private void __loadFromFields0(Iterator<String> __it) {
    String __cur_str = null;
    try {
    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ROW_WID = null; } else {
      this.ROW_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.INTEGRATION_ID = null; } else {
      this.INTEGRATION_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_CODE = null; } else {
      this.DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_NAME = null; } else {
      this.DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_SHORT_NAME = null; } else {
      this.DEALER_SHORT_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARTNER_DEALER_CODE = null; } else {
      this.PARTNER_DEALER_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PARTNER_DEALER_NAME = null; } else {
      this.PARTNER_DEALER_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CODE = null; } else {
      this.BG_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_NAME = null; } else {
      this.BG_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_AREA_NAME = null; } else {
      this.BG_AREA_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_REGION_NAME = null; } else {
      this.BG_REGION_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CITY_GROUP_NAME = null; } else {
      this.BG_CITY_GROUP_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.BG_CITY_NAME = null; } else {
      this.BG_CITY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.WAREHOUSE_NAME = null; } else {
      this.WAREHOUSE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.PROVINCE_NAME = null; } else {
      this.PROVINCE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CITY_NAME = null; } else {
      this.CITY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.COUNTY_NAME = null; } else {
      this.COUNTY_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RESPONSIBLE_NAME = null; } else {
      this.RESPONSIBLE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RESPONSIBLE_PHONE = null; } else {
      this.RESPONSIBLE_PHONE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.EMAIL_ADDR = null; } else {
      this.EMAIL_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.OFFICE_ADDR = null; } else {
      this.OFFICE_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_ADDR = null; } else {
      this.RECEIVE_ADDR = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_NAME = null; } else {
      this.RECEIVE_NAME = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.RECEIVE_PHONE = null; } else {
      this.RECEIVE_PHONE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_TYPE = null; } else {
      this.DEALER_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_LEVEL = null; } else {
      this.DEALER_LEVEL = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CHANNEL_TYPE = null; } else {
      this.CHANNEL_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CREATED_BY_ID = null; } else {
      this.CREATED_BY_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.CHANGED_BY_ID = null; } else {
      this.CHANGED_BY_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CREATED_ON_DT = null; } else {
      this.CREATED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.CHANGED_ON_DT = null; } else {
      this.CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX1_CHANGED_ON_DT = null; } else {
      this.AUX1_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX2_CHANGED_ON_DT = null; } else {
      this.AUX2_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX3_CHANGED_ON_DT = null; } else {
      this.AUX3_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.AUX4_CHANGED_ON_DT = null; } else {
      this.AUX4_CHANGED_ON_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_INSERT_DT = null; } else {
      this.W_INSERT_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.W_UPDATE_DT = null; } else {
      this.W_UPDATE_DT = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.ETL_PROC_WID = null; } else {
      this.ETL_PROC_WID = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_FROM = null; } else {
      this.DATE_FROM = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.DATE_TO = null; } else {
      this.DATE_TO = java.sql.Timestamp.valueOf(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null") || __cur_str.length() == 0) { this.VERSION = null; } else {
      this.VERSION = new java.math.BigDecimal(__cur_str);
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.ROW_ID = null; } else {
      this.ROW_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DEALER_ERP_CODE = null; } else {
      this.DEALER_ERP_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.DATASOURCE_ID = null; } else {
      this.DATASOURCE_ID = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.AREA_CODE = null; } else {
      this.AREA_CODE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.SALE_TYPE = null; } else {
      this.SALE_TYPE = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.IS_WAREHOUSE_CUSTOMER = null; } else {
      this.IS_WAREHOUSE_CUSTOMER = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.TEST_FLG = null; } else {
      this.TEST_FLG = __cur_str;
    }

    __cur_str = __it.next();
    if (__cur_str.equals("null")) { this.STATUS = null; } else {
      this.STATUS = __cur_str;
    }

    } catch (RuntimeException e) {    throw new RuntimeException("Can't parse input data: '" + __cur_str + "'", e);    }  }

  public Object clone() throws CloneNotSupportedException {
    W_DMS_DEALER_D1 o = (W_DMS_DEALER_D1) super.clone();
    o.CREATED_ON_DT = (o.CREATED_ON_DT != null) ? (java.sql.Timestamp) o.CREATED_ON_DT.clone() : null;
    o.CHANGED_ON_DT = (o.CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.CHANGED_ON_DT.clone() : null;
    o.AUX1_CHANGED_ON_DT = (o.AUX1_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX1_CHANGED_ON_DT.clone() : null;
    o.AUX2_CHANGED_ON_DT = (o.AUX2_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX2_CHANGED_ON_DT.clone() : null;
    o.AUX3_CHANGED_ON_DT = (o.AUX3_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX3_CHANGED_ON_DT.clone() : null;
    o.AUX4_CHANGED_ON_DT = (o.AUX4_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX4_CHANGED_ON_DT.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
    return o;
  }

  public void clone0(W_DMS_DEALER_D1 o) throws CloneNotSupportedException {
    o.CREATED_ON_DT = (o.CREATED_ON_DT != null) ? (java.sql.Timestamp) o.CREATED_ON_DT.clone() : null;
    o.CHANGED_ON_DT = (o.CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.CHANGED_ON_DT.clone() : null;
    o.AUX1_CHANGED_ON_DT = (o.AUX1_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX1_CHANGED_ON_DT.clone() : null;
    o.AUX2_CHANGED_ON_DT = (o.AUX2_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX2_CHANGED_ON_DT.clone() : null;
    o.AUX3_CHANGED_ON_DT = (o.AUX3_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX3_CHANGED_ON_DT.clone() : null;
    o.AUX4_CHANGED_ON_DT = (o.AUX4_CHANGED_ON_DT != null) ? (java.sql.Timestamp) o.AUX4_CHANGED_ON_DT.clone() : null;
    o.W_INSERT_DT = (o.W_INSERT_DT != null) ? (java.sql.Timestamp) o.W_INSERT_DT.clone() : null;
    o.W_UPDATE_DT = (o.W_UPDATE_DT != null) ? (java.sql.Timestamp) o.W_UPDATE_DT.clone() : null;
    o.DATE_FROM = (o.DATE_FROM != null) ? (java.sql.Timestamp) o.DATE_FROM.clone() : null;
    o.DATE_TO = (o.DATE_TO != null) ? (java.sql.Timestamp) o.DATE_TO.clone() : null;
  }

  public Map<String, Object> getFieldMap() {
    Map<String, Object> __sqoop$field_map = new HashMap<String, Object>();
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("DEALER_CODE", this.DEALER_CODE);
    __sqoop$field_map.put("DEALER_NAME", this.DEALER_NAME);
    __sqoop$field_map.put("DEALER_SHORT_NAME", this.DEALER_SHORT_NAME);
    __sqoop$field_map.put("PARTNER_DEALER_CODE", this.PARTNER_DEALER_CODE);
    __sqoop$field_map.put("PARTNER_DEALER_NAME", this.PARTNER_DEALER_NAME);
    __sqoop$field_map.put("BG_CODE", this.BG_CODE);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("BG_AREA_NAME", this.BG_AREA_NAME);
    __sqoop$field_map.put("BG_REGION_NAME", this.BG_REGION_NAME);
    __sqoop$field_map.put("BG_CITY_GROUP_NAME", this.BG_CITY_GROUP_NAME);
    __sqoop$field_map.put("BG_CITY_NAME", this.BG_CITY_NAME);
    __sqoop$field_map.put("WAREHOUSE_NAME", this.WAREHOUSE_NAME);
    __sqoop$field_map.put("PROVINCE_NAME", this.PROVINCE_NAME);
    __sqoop$field_map.put("CITY_NAME", this.CITY_NAME);
    __sqoop$field_map.put("COUNTY_NAME", this.COUNTY_NAME);
    __sqoop$field_map.put("RESPONSIBLE_NAME", this.RESPONSIBLE_NAME);
    __sqoop$field_map.put("RESPONSIBLE_PHONE", this.RESPONSIBLE_PHONE);
    __sqoop$field_map.put("EMAIL_ADDR", this.EMAIL_ADDR);
    __sqoop$field_map.put("OFFICE_ADDR", this.OFFICE_ADDR);
    __sqoop$field_map.put("RECEIVE_ADDR", this.RECEIVE_ADDR);
    __sqoop$field_map.put("RECEIVE_NAME", this.RECEIVE_NAME);
    __sqoop$field_map.put("RECEIVE_PHONE", this.RECEIVE_PHONE);
    __sqoop$field_map.put("DEALER_TYPE", this.DEALER_TYPE);
    __sqoop$field_map.put("DEALER_LEVEL", this.DEALER_LEVEL);
    __sqoop$field_map.put("CHANNEL_TYPE", this.CHANNEL_TYPE);
    __sqoop$field_map.put("CREATED_BY_ID", this.CREATED_BY_ID);
    __sqoop$field_map.put("CHANGED_BY_ID", this.CHANGED_BY_ID);
    __sqoop$field_map.put("CREATED_ON_DT", this.CREATED_ON_DT);
    __sqoop$field_map.put("CHANGED_ON_DT", this.CHANGED_ON_DT);
    __sqoop$field_map.put("AUX1_CHANGED_ON_DT", this.AUX1_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX2_CHANGED_ON_DT", this.AUX2_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX3_CHANGED_ON_DT", this.AUX3_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX4_CHANGED_ON_DT", this.AUX4_CHANGED_ON_DT);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("ETL_PROC_WID", this.ETL_PROC_WID);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("ROW_ID", this.ROW_ID);
    __sqoop$field_map.put("DEALER_ERP_CODE", this.DEALER_ERP_CODE);
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("AREA_CODE", this.AREA_CODE);
    __sqoop$field_map.put("SALE_TYPE", this.SALE_TYPE);
    __sqoop$field_map.put("IS_WAREHOUSE_CUSTOMER", this.IS_WAREHOUSE_CUSTOMER);
    __sqoop$field_map.put("TEST_FLG", this.TEST_FLG);
    __sqoop$field_map.put("STATUS", this.STATUS);
    return __sqoop$field_map;
  }

  public void getFieldMap0(Map<String, Object> __sqoop$field_map) {
    __sqoop$field_map.put("ROW_WID", this.ROW_WID);
    __sqoop$field_map.put("INTEGRATION_ID", this.INTEGRATION_ID);
    __sqoop$field_map.put("DEALER_CODE", this.DEALER_CODE);
    __sqoop$field_map.put("DEALER_NAME", this.DEALER_NAME);
    __sqoop$field_map.put("DEALER_SHORT_NAME", this.DEALER_SHORT_NAME);
    __sqoop$field_map.put("PARTNER_DEALER_CODE", this.PARTNER_DEALER_CODE);
    __sqoop$field_map.put("PARTNER_DEALER_NAME", this.PARTNER_DEALER_NAME);
    __sqoop$field_map.put("BG_CODE", this.BG_CODE);
    __sqoop$field_map.put("BG_NAME", this.BG_NAME);
    __sqoop$field_map.put("BG_AREA_NAME", this.BG_AREA_NAME);
    __sqoop$field_map.put("BG_REGION_NAME", this.BG_REGION_NAME);
    __sqoop$field_map.put("BG_CITY_GROUP_NAME", this.BG_CITY_GROUP_NAME);
    __sqoop$field_map.put("BG_CITY_NAME", this.BG_CITY_NAME);
    __sqoop$field_map.put("WAREHOUSE_NAME", this.WAREHOUSE_NAME);
    __sqoop$field_map.put("PROVINCE_NAME", this.PROVINCE_NAME);
    __sqoop$field_map.put("CITY_NAME", this.CITY_NAME);
    __sqoop$field_map.put("COUNTY_NAME", this.COUNTY_NAME);
    __sqoop$field_map.put("RESPONSIBLE_NAME", this.RESPONSIBLE_NAME);
    __sqoop$field_map.put("RESPONSIBLE_PHONE", this.RESPONSIBLE_PHONE);
    __sqoop$field_map.put("EMAIL_ADDR", this.EMAIL_ADDR);
    __sqoop$field_map.put("OFFICE_ADDR", this.OFFICE_ADDR);
    __sqoop$field_map.put("RECEIVE_ADDR", this.RECEIVE_ADDR);
    __sqoop$field_map.put("RECEIVE_NAME", this.RECEIVE_NAME);
    __sqoop$field_map.put("RECEIVE_PHONE", this.RECEIVE_PHONE);
    __sqoop$field_map.put("DEALER_TYPE", this.DEALER_TYPE);
    __sqoop$field_map.put("DEALER_LEVEL", this.DEALER_LEVEL);
    __sqoop$field_map.put("CHANNEL_TYPE", this.CHANNEL_TYPE);
    __sqoop$field_map.put("CREATED_BY_ID", this.CREATED_BY_ID);
    __sqoop$field_map.put("CHANGED_BY_ID", this.CHANGED_BY_ID);
    __sqoop$field_map.put("CREATED_ON_DT", this.CREATED_ON_DT);
    __sqoop$field_map.put("CHANGED_ON_DT", this.CHANGED_ON_DT);
    __sqoop$field_map.put("AUX1_CHANGED_ON_DT", this.AUX1_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX2_CHANGED_ON_DT", this.AUX2_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX3_CHANGED_ON_DT", this.AUX3_CHANGED_ON_DT);
    __sqoop$field_map.put("AUX4_CHANGED_ON_DT", this.AUX4_CHANGED_ON_DT);
    __sqoop$field_map.put("W_INSERT_DT", this.W_INSERT_DT);
    __sqoop$field_map.put("W_UPDATE_DT", this.W_UPDATE_DT);
    __sqoop$field_map.put("ETL_PROC_WID", this.ETL_PROC_WID);
    __sqoop$field_map.put("DATE_FROM", this.DATE_FROM);
    __sqoop$field_map.put("DATE_TO", this.DATE_TO);
    __sqoop$field_map.put("VERSION", this.VERSION);
    __sqoop$field_map.put("ROW_ID", this.ROW_ID);
    __sqoop$field_map.put("DEALER_ERP_CODE", this.DEALER_ERP_CODE);
    __sqoop$field_map.put("DATASOURCE_ID", this.DATASOURCE_ID);
    __sqoop$field_map.put("AREA_CODE", this.AREA_CODE);
    __sqoop$field_map.put("SALE_TYPE", this.SALE_TYPE);
    __sqoop$field_map.put("IS_WAREHOUSE_CUSTOMER", this.IS_WAREHOUSE_CUSTOMER);
    __sqoop$field_map.put("TEST_FLG", this.TEST_FLG);
    __sqoop$field_map.put("STATUS", this.STATUS);
  }

  public void setField(String __fieldName, Object __fieldVal) {
    if (!setters.containsKey(__fieldName)) {
      throw new RuntimeException("No such field:"+__fieldName);
    }
    setters.get(__fieldName).setField(__fieldVal);
  }

}
