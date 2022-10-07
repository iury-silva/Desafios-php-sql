function WebServiceExec($params, $data)
{
	$f = Db::Read()->Clear()
		->select([
			'dt_nascimento',
			'dt_inicial',
			'dt_final',
			'valor_mensal',
			'sexo',
			'estado_civil',
			'origem_contrato',
			'renovacao_automaiica'
				 ])
		->from('base_pessoa bp')
		->join('gs_contrato gc','gc.idpessoa=bp.idpessoa')
		->whereAND(['cpf'=>$data['cpf']])
		->fetchAll();	
	
	
	for($i=0;$i<$f;$i++){
//DATAS AMIGO :)
	
	$d = $f[$i]['dt_nascimento']; 
    $f[$i]['dt_nascimento'] = date('d/m/Y',strtotime($d));
	
	$d = $f[$i]['dt_inicial']; 
    $f[$i]['dt_inicial'] = date('d/m/Y', strtotime($d));
	
	
	$d = $f[$i]['dt_final']; 
	$f[$i]['dt_final'] = date('d/m/Y', strtotime($d));
	
	
//SEXO AMIGO *)
	
	if($f[$i]['sexo']==2){
		
		$f[$i]['sexo'] = 'masc';
		
	}else if($f[$i]['sexo']==3){
		$f[$i]['sexo'] = 'fem';		
	}else if($f[$i]['sexo']==4){
		$f[$i]['sexo'] = 'outros';
	}else
		$f[$i]['sexo'] = 'não especificado';
	
	
//ESTADO CIVIL AMIGAO :/
	
	switch($f[$i]['estado_civil']){
	
		case '1':
		$f[$i]['estado_civil'] = 'Solteiro';
		break;
		
		case '2':
		$f[$i]['estado_civil'] = 'Casado';
		break;
		
		case '3':
		$f[$i]['estado_civil'] = 'Divorciado';
		break;
		
		case '4':
		$f[$i]['estado_civil'] = 'Viúvo';
		break;
		
		case '5':
		$f[$i]['estado_civil'] = 'Separado';
		break;
		
	}
	
	$f[$i]['valor_mensal'] = 'R$'. number_format($f[$i]['valor_mensal'], 2, ',', '.');
	
	if($f[$i]['renovacao_automatica']==1){
		$f[$i]['renovacao_automatica']='sim';
	}
	if($f[$i]['renovacao_automatica']==0){
		$f[$i]['renovacao_automatica']='nao';
	}
	
	($f[$i]['origem_contrato']=='1')?$f[$i]['origem_contrato'] = 'Gerencial':($f[$i]['origem_contrato']=='2')?$f[$i]['origem_contrato']='WEB':$f[$i]['origem_contrato']='importado';
	
	
	}	
	
	return $f; 



}

//////////////////////////////////////////////////////////////////////////////////

function WebServiceExec($params, $data)
{
	$f = Db::Read()->Clear()
		->select([
			'dt_nascimento',
			'dt_inicial',
			'dt_final',
			'valor_mensal',
			'sexo',
			'estado_civil',
			'origem_contrato',
			'renovacao_automaiica'
				 ])
		->from('base_pessoa bp')
		->join('gs_contrato gc','gc.idpessoa=bp.idpessoa')
		->whereAND(['cpf'=>$data['cpf']])
		->fetchAll();	
	
	
	
//DATAS AMIGO :)
	
	$d = $f[0]['dt_nascimento']; 
    $f[$i]['dt_nascimento'] = date('d/m/Y',strtotime($d));
	
	$d = $f[$i]['dt_inicial']; 
    $f[$i]['dt_inicial'] = date('d/m/Y', strtotime($d));
	
	
	$d = $f[$i]['dt_final']; 
	$f[$i]['dt_final'] = date('d/m/Y', strtotime($d));
	
	
//SEXO AMIGO *)
	
	if($f[$i]['sexo']==2){
		
		$f[$i]['sexo'] = 'masc';
		
	}else if($f[$i]['sexo']==3){
		$f[$i]['sexo'] = 'fem';		
	}else if($f[$i]['sexo']==4){
		$f[$i]['sexo'] = 'outros';
	}else
		$f[$i]['sexo'] = 'não especificado';
	
	
//ESTADO CIVIL AMIGAO :/
	
	switch($f[$i]['estado_civil']){
	
		case '1':
		$f[$i]['estado_civil'] = 'Solteiro';
		break;
		
		case '2':
		$f[$i]['estado_civil'] = 'Casado';
		break;
		
		case '3':
		$f[$i]['estado_civil'] = 'Divorciado';
		break;
		
		case '4':
		$f[$i]['estado_civil'] = 'Viúvo';
		break;
		
		case '5':
		$f[$i]['estado_civil'] = 'Separado';
		break;
		
	}
	
	$f[$i]['valor_mensal'] = 'R$'. number_format($f[$i]['valor_mensal'], 2, ',', '.');
	
	if($f[$i]['renovacao_automatica']==1){
		$f[$i]['renovacao_automatica']='sim';
	}
	if($f[$i]['renovacao_automatica']==0){
		$f[$i]['renovacao_automatica']='nao';
	}
	
	($f[$i]['origem_contrato']=='1')?$f[$i]['origem_contrato'] = 'Gerencial':($f[$i]['origem_contrato']=='2')?$f[$i]['origem_contrato']='WEB':$f[$i]['origem_contrato']='importado';
	
	
	
	
	return $f; 



}