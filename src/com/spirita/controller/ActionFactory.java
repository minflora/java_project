package com.spirita.controller;

import com.spirita.action.*;
import com.spirita.action.admin.*;

public class ActionFactory {

	private static ActionFactory instance = new ActionFactory();

	private ActionFactory() {
		super();
	}

	public static ActionFactory getInstance() {
		return instance;
	}

	public Action getAction(String command) {
		Action action = null;
		System.out.println("ActionFactory : " + command);


		if(command.equals("login_form")) {
			action = new LoginFormAction();
		}else if(command.equals("login")) {
			action = new LoginAction();
		}else if(command.equals("find_id_form")) {
			action = new FindIdFormAction();
		}else if(command.equals("find_id")) {
			action = new FindIdAction();
		}else if(command.equals("find_pwd_form")) {
			action = new FindPwdFormAction();
		}else if(command.equals("find_pwd")) {
			action = new FindPwdAction();
		}else if(command.equals("join_form")) {
			action = new JoinFormAction();
		}else if(command.equals("id_check_form")) {
			action = new IdCheckFormAction();
		}else if(command.equals("join")) {
			action = new JoinAction();
		}else if(command.equals("index")) {
			action = new IndexAction();
		}else if(command.equals("cart_list")) {
			action = new CartListAction();
		}else if(command.equals("mypage")) {
			action = new MyPageAction();
		}else if(command.equals("order_detail")) {
			action = new OrderDetailAction();
		}else if(command.equals("cart_insert")) {
			action = new CartInsertAction();
		}else if(command.equals("cart_delete")) {
			action = new CartDeleteAction();
		}else if(command.equals("order_insert")) {
			action = new OrderInsertAction();
		}else if(command.equals("order_list")) {
			action = new OrderListAction();
		}else if(command.equals("product_detail")) {
			action = new ProductDetailAction();
		}else if(command.equals("logout")) {
			action = new LogoutAction();
		}else if(command.equals("order_all")) {
			action = new OrderAllAction();
		}else if(command.equals("category")) {
			action = new ProductKindAction();
		}else if(command.equals("product_list")) {
			action = new ProductListAction();
		}else if (command.equals("qna_list")) {
		     action = new QnaListAction();
	    }else if (command.equals("qna_write_form")) {
	    	action = new QnaWriteFormAction();
	    }else if (command.equals("qna_write")) {
	    	action = new QnaWriteAction();
	    }else if (command.equals("qna_view")) {
	    	action = new QnaViewAction();
	    }else if (command.equals("notice_view")) {
	    	action = new NoticeViewAction();
	    }else if (command.equals("notice_list")) {
	    	action = new NoticeListAction();
	    }


		// admin

		if (command.equals("admin_login_form")) {
			action = new AdminIndexAction();
		} else if (command.equals("admin_login")) {
			action = new AdminLoginAction();
		} else if (command.equals("admin_logout")) {
			action = new AdminLogoutAction();
		} else if (command.equals("admin_product_list")) {
			action = new AdminProductListAction();
		} else if (command.equals("admin_product_write_form")) {
			action = new AdminProductWriteFormAction();
		} else if (command.equals("admin_product_write")) {
			action = new AdminProductWriteAction();
		} else if (command.equals("admin_product_detail")) {
			action = new AdminProductDetailAction();
		} else if (command.equals("admin_product_update_form")) {
			action = new AdminProductUpdateFormAction();
		} else if (command.equals("admin_product_update")) {
			action = new AdminProductUpdateAction();
		} else if (command.equals("admin_order_list")) {
			action = new AdminOrderListAction();
		} else if (command.equals("admin_order_save")) {
			action = new AdminOrderSaveAction();
		} else if (command.equals("admin_member_list")) {
			action = new AdminMemberListAction();
		} else if (command.equals("admin_qna_list")) {
			action = new AdminQnaListAction();
		} else if (command.equals("admin_qna_detail")) {
			action = new AdminQnaDetailAction();
		} else if (command.equals("admin_qna_repsave")) {
			action = new AdminQnaResaveAction();
		} else if (command.equals("admin_notice_list")) {
			action = new AdminNoticeListAction();
		} else if (command.equals("admin_notice_write_form")) {
			action = new AdminNoticeWriteFormAction();
		} else if (command.equals("admin_notice_write")) {
			action = new AdminNoticeWriteAction();
		} else if (command.equals("admin_notice_view")) {
			action = new AdminNoticeViewAction();
		} else if (command.equals("admin_notice_update")) {
			action = new AdminNoticeUpdateAction();
		} else if (command.equals("admin_notice_delete")) {
			action = new AdminNoticeDeleteAction();
		} else if (command.equals("admin_notice_update_form")) {
			action = new AdminNoticeUpdateFormAction();
		} else if (command.equals("admin_product_delete")) {
			action = new AdminProductDeleteAction();
		}

		return action;
	}
}
