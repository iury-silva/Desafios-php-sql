
    $apre = Db::Read()->Clear()
		->select(['sa.dscapresentacao',
				 'sa.capacidade',
				  'sa.dthr_apresentacao',
				  'pp.dscproduto',
				  'mvi.status',
				  'count(capacidade) cap'
				 ])
		->from('si_apresentacao sa')
		->join('pdv_produto pp','pp.ativo=sa.ativo')
		->join('pdv_produto_mov_item mvi','mvi.idproduto=pp.idproduto')
		->join('base_usuario bu','bu.alt_idusuario=pp.alt_idusuario')
		->groupBy([1,2,3,4,5])
		->whereOR(["status"=>"PA"])
		->whereOR(["status"=>"PC"])



    ///////////////////////////////////////////////////////////////////////////////
    
    <?php
	$f = $params['filtros'];
		
    $apre = Db::Read()->Clear()
		->select(['sa.dscapresentacao ',
				 'sa.capacidade',
				  'sa.dthr_apresentacao',
				  'pp.dscproduto',
				  'mvi.status'
				 ])
		->from('si_apresentacao sa')
		->join('pdv_produto pp','pp.ativo=sa.ativo')
		->join('pdv_produto_mov_item mvi','mvi.idproduto=pp.idproduto')
		->whereOR(["mvi.status"=>"PA"])
		->whereOR(["mvi.status"=>"PC"])
		->whereOR(['sa.idapresentacao' => new we_Where_Equal($f['apresentacao'])])
		->fetchAll();

    return ["rows" => $apre];
		
		//////////////////////////////////////////////////////////////////////////////////////////////

		$apre = Db::Read()->Clear()
		->select(['sa.dscapresentacao',
				 'sa.capacidade',
				  'sa.dthr_apresentacao',
				  'pp.dscproduto',
				  'mvi.status',
				  'count(bu.usuario) usuarios'
				 ])
		->from('si_apresentacao sa')
		->join('pdv_produto pp','pp.ativo=sa.ativo')
		->join('pdv_produto_mov_item mvi','mvi.idproduto=pp.idproduto')
		->join('base_usuario bu','bu.alt_idusuario=pp.alt_idusuario')
		->groupBy([1,2,3,4,5])
		->whereOR(["status"=>"PA"])
		->whereOR(["status"=>"PC"])



///////////////////////////////////////////////////////////////////////////////////////////////////////

$f = Db::Read()->Clear()
		->select([
			'cpf',
			'dt_nascimento',
			'dt_inicial',
			'dt_final',
			'valor_mensal',
			'sexo',
			'estado_civil',
			'origem_contrato',
			'renovacao_automatica'
				 ])
		->from('base_pessoa bp')
		->join('gs_contrato gc','gc.idpessoa=bp.idpessoa')

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
<?php
	$f = $params['filtros'];
		/*
    $apre = Db::Read()->Clear()
		->select([
			      'ppt.capacidade',
				  'sa.dthr_apresentacao dataa',
				  'pp.dscproduto',
			      'ppt.dsctipoproduto',  
				  'mvi.status',
				  'count(idmovimentacaoitem) publico'
				 ])
		->from('si_apresentacao sa')
		->join('pdv_produto pp','pp.ativo=sa.ativo')
		->join('pdv_produto_mov_item mvi','mvi.idproduto=pp.idproduto')
		->join('base_usuario bu','bu.alt_idusuario=pp.alt_idusuario')
        ->join('pdv_produto_tipo ppt', 'pp.idtipoproduto = ppt.idtipoproduto')
		->whereOR(["mvi.status"=>"PA"])
		->whereOR(["mvi.status"=>"PC"])
		->whereOR(['sa.idapresentacao' => new we_Where_Equal($f['apresentacao'])])
		->whereNotAND(["pp.dscproduto"=>"Cortesia"])
		->groupBy([1,2,3,4,5])
		->fetchAll();*/

    $apre = Db::Read()->Clear()
	->select(['ppt.capacidade',
				  'sa.dthr_apresentacao dataa',
				  'pp.dscproduto',
			      'ppt.dsctipoproduto',  
				  'mvi.status',
				  'count(idmovimentacaoitem) normais'])
	->from('pdv_produto_tipo ppt')
	->join('pdv_produto pp', 'pp.idtipoproduto = ppt.idtipoproduto')
	->join('pdv_produto_mov_item mvi', 'mvi.idproduto = pp.idproduto')
	->join('si_apresentacao sa', 'mvi.idapresentacao = sa.idapresentacao')
	->whereAND(['ppt.capacidade'=> new we_Where_Greater(0)])				
	->whereAND(['mvi.idapresentacao' => $f['apresentacao']])
	->whereAND(["mvi.status"=> ["PA", "PC"]])
	->whereNotAND(["pp.dscproduto"=>"Cortesia"])
	
		->groupBy([1,2,3,4,5])
		->fetchAll();
    
    $cort = Db::Read()->Clear()
		->select(['ppt.dsctipoproduto','count(idmovimentacaoitem) as cortesia'])
		->from('pdv_produto_tipo ppt')
	   ->join('pdv_produto pp', 'pp.idtipoproduto = ppt.idtipoproduto')
	   ->join('pdv_produto_mov_item mvi', 'mvi.idproduto = pp.idproduto')
	   ->join('si_apresentacao sa', 'mvi.idapresentacao = sa.idapresentacao')
		->whereOR(['sa.idapresentacao' => new we_Where_Equal($f['apresentacao'])])
		->whereAND(['pp.dscproduto'=>'Cortesia'])
		->groupBy([1])
		->fetchAll();

    foreach($apre as &$r){
		
		$r ['cortesia'] = 0;
		
		foreach($cort as &$p){
		
			if($p ['dsctipoproduto'] == $r [ 'dsctipoproduto']){
			
			    $r['cortesia'] = $p ['cortesia'];
			
			
			}
			
		}
		
  }

		
		foreach($apre as &$r){
		
		    $r['publico'] = $r['normais'] + $r['cortesia'];
		
		
		}

		foreach($apre as &$value){
		
		$div = $value['publico']/$value['capacidade'];
		$porc = 100*$div;
		$cap = $value['publico'] - $value['capacidade'];
		$value['porcentagem'] = $porc . "%";
		$value['disponivel'] = $cap;	
		
		}
		
		

   
	



    return ["rows" => $apre];